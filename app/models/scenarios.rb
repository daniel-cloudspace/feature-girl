class Scenario < ActiveRecord::Base
  belongs_to :feature
  has_and_belongs_to_many :tags
end
