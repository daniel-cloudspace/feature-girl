class FeaturesController < ApplicationController
  def index
    @features = Feature.all
  end
end

