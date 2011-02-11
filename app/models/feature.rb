class Feature < ActiveRecord::Base
  has_many :scenarios

  acts_as_taggable_on :tags

  def self.load_cucumber_files(path)
    files = Dir.glob("#{path}*.feature")
    #files = [ "features/feature.feature" ]
    puts files

    files.each do |file|
      contents = File.open(file, 'r').readlines
      #puts contents.to_yaml

      feature_or_scenario_begin = /^[\s]*(@|Feature:|Scenario:)/
      feature_boundary = /^[\s]*(@|Feature:)/
      scenario_boundary = /^[\s]*(@|Scenario:)/

      length = contents.length
      i = 0
      while i < length do
        #process feature
        if contents[i].match(feature_or_scenario_begin)
          end_found = false
          start = i
          i += 1
          #iterate over block to match the beginning of a new block or end of file
          while(!end_found and i < contents.length)
            if contents[i].match(scenario_boundary) and !contents[i-1].match(feature_or_scenario_begin)
              end_found = true
            end
            i += 1
          end
          # rollback to the row having that we matched
          i -= 1
          #if not the end of file, go back one more index
          if end_found
            i -= 1
          end

          #send block to processor
          content_block = contents[start..i]
          #puts '================================'
          #puts content_block
          if content_block[0].match("Feature") or content_block[1].match("Feature")
            self.process_feature_section(content_block)
          elsif content_block[0].match("Scenario") or content_block[1].match("Scenario")
            self.process_scenario_section(content_block)
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
    if contents[0].match('Feature:')
      title = contents[0].gsub('Feature:', '').strip
      description = contents[1..-1].join('\n')
    else
      tags = contents[0].scan(/@[^\s@]*/)
      title = contents[1].gsub('Feature:', '').strip
      description = contents[2..-1].join('\n')
    end
    f = Feature.create(:title => title, :description => description)
    if tags
      f.tag_list = tags
    end
    puts f.inspect
    f.save
  end

  def self.process_scenario_section(contents)
    #puts "processing scenario"
    #puts contents
    if contents[0].match('Scenario:')
      title = contents[0].gsub('Scenario:', '').strip
      steps = contents[1..-1].join('\n')
    else
      tags = contents[0].scan(/@[^\s@]*/)
      title = contents[1].gsub('Scenario:', '').strip
      steps = contents[2..-1].join('\n')
    end
    s = Scenario.create(:title => title, :steps => steps)
    if tags
      s.tag_list = tags
    end
    puts s.inspect
    s.save
  end

  def write_cucumber_files
    puts "Write out the tagging changes to the cucumber files"
  end
end
