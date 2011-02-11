require 'machinist/active_record'
require 'sham'
require 'faker'
require 'random_data'

puts "Blueprints Loaded"

NotUnique = { :unique => false }
#model specific values
Sham.feature_title { |i| "Feature #{i}" }
Sham.scenario_title { |i| "Scenario #{i}" }
Sham.tag_name { |i| "@tag_#{i}" }

#feature description
Sham.feature_description { ["In order to", Random.paragraphs(1), "I want to be able to", Random.paragraphs(1)].join(' ') }

#cucumber scenario
Sham.given_string { ["Given", Random.paragraphs(1)].join(' ') }
Sham.when_string{ ["When", Random.paragraphs(1)].join(' ') }
Sham.then_string { ["Given", Random.paragraphs(1)].join(' ') }
Sham.scenario_text { [Sham.given_string, Sham.when_string, Sham.then_string].join('\n') }

Sham.tag_list { ["\"", Random.paragraphs(1).split(' '), "\""].join(', ') }

Feature.blueprint do
  title Sham.feature_title
  description Sham.feature_description
end

ActsAsTaggableOn::Tag.blueprint do
  name Sham.tag_name
end

Scenario.blueprint do
  title Sham.scenario_title
  steps Sham.scenario_text
  feature { Feature.make }
  tags { [ActsAsTaggableOn::Tag.make] }
end
