class Feature < ActiveRecord::Base
  has_many :scenarios

  acts_as_taggable_on :tags

  #load cucumber features and scenarios from the given path
  #path needs to end with a /
  def self.load_cucumber_files(path)
    files = Dir.glob("#{path}*.feature")
    #files = [ "features/feature.feature" ]
    #puts files

    files.each do |file|
      contents = File.open(file, 'r').readlines
      #puts contents.to_yaml

      # the feature for the scenarios
      feature = nil
      # beginning of a scenario or feature
      feature_or_scenario_begin = /^[\s]*(@|Feature:|Scenario:)/
      # not used
      feature_boundary = /^[\s]*(@|Feature:)/
      # beginning of a scneario, or a marker for the beginning of the next scenario
      scenario_boundary = /^[\s]*(@|Scenario:)/

      length = contents.length
      i = 0
      # loop over the content array
      while i < length do
        # if a comment is found, delete from the hash to the end of line and continue processing the line
        # this doesn't work, commenting out for now
        #contents[i] = contents[i].gsub(/##[.]*/, '')
        # if you find a feature or scenario, start searching the next lines for the rest of the block
        if contents[i].match(feature_or_scenario_begin)
          end_found = false
          start = i
          i += 1
          #iterate over block until matching the beginning of a new block or end of file
          while(!end_found and i < contents.length)
            if contents[i].match(scenario_boundary) and !contents[i-1].match(feature_or_scenario_begin)
              end_found = true
            else
              i += 1
            end
          end
          # rollback to the row having that we matched
          i -= 1

          # send block to processor
          content_block = contents[start..i]
          #puts '================================'
          #puts content_block
          # The text that determines whether this is a feature or scenario could be on the first or second line
          # cannot use the standard regular expressions because they will match tags on the first line regardless
          if content_block[0].match("Feature") or content_block[1].match("Feature")
            feature = self.process_feature_section(content_block)
          elsif content_block[0].match("Scenario") or content_block[1].match("Scenario")
            self.process_scenario_section(content_block, feature)
          end
        else
          i += 1
        end
      end
    end
  end

  def self.process_feature_section(contents)
    #puts 'processing a feature'
    #puts contents
    # if there are no tags
    if contents[0].match('Feature:')
      title = contents[0].gsub('Feature:', '').strip
      description = contents[1..-1].join('\n')
    else # if there are tags
      tags = contents[0].scan(/@[^\s@]*/)
      title = contents[1].gsub('Feature:', '').strip
      description = contents[2..-1].join('\n')
    end

    # create feature, associate tags and save
    f = Feature.create(:title => title, :description => description)
    if tags
      f.tag_list = tags
    end
    f.save
    return f
  end

  def self.process_scenario_section(contents, feature)
    #puts "processing scenario"
    #puts contents
    tags = []
    # if there are no tags
    if contents[0].match('Scenario:')
      title = contents[0].gsub('Scenario:', '').strip
      steps = contents[1..-1].join('\n')
    else # if there are tags
      tags << contents[0].scan(/@[^\s@]*/)
      title = contents[1].gsub('Scenario:', '').strip
      steps = contents[2..-1].join('\n')
    end

    # create scenario, associate tags and save
    # assume the feature is the most recently created feature
    # maybe not the best idea

    s = Scenario.create(:title => title, :steps => steps, :feature_id => feature.id)

    tags << feature.tag_list
    tags << "@#{feature.title.downcase}"
    tags.flatten!.uniq!
    puts "Tags: " + tags.inspect

    s.tag_list = tags.join ','
    #puts s.inspect
    s.save
  end

  def write_cucumber_files
    puts "Write out the tagging changes to the cucumber files"
  end
end
