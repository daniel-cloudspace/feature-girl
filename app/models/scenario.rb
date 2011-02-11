class Scenario < ActiveRecord::Base
  belongs_to :feature

  acts_as_taggable_on :tags

  validates_presence_of :title, :steps
end
