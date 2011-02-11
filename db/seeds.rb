# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def data_for file_symbol 
  YAML.load(File.open(
    File.join(RAILS_ROOT, 'db', 'seeds_data', file_symbol.to_s + '.yaml')
  ).read)
end

# default organizations
# data_for(:organizations).each do |data|
#   Organization.create :name => data['name'], :enabled => data['enabled'], :generate_user_emails => data['generate_user_emails']
# end
#

data_for(:features).each do |data|
  Feature.create(:title => data['title'], :description => data['description'])
end

data_for(:scenarios).each do |data|
  @scenario = Scenario.create(:title => data['title'], :steps => data['steps'], :feature => Feature.first(:conditions => {:title => data['feature']}))
  @scenario.tag_list = data['tags']
  @scenario.save
end
