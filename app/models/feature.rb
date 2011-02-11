class Feature < ActiveRecord::Base
  has_many :scenarios

  acts_as_taggable_on :tags
end
