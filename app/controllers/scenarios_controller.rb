class ScenariosController < ApplicationController
  def index
    @scenarios = Scenario.all
  end
end
