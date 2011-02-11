class Feature < ActiveRecord::Base
  has_many :scenarios

  validates_presence_of :title

end
