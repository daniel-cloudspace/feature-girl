class Scenario < ActiveRecord::Base
  belongs_to :feature
  acts_as_taggable_on :tags
end
