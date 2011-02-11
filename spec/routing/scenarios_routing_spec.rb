require "spec_helper"

describe ScenariosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/scenarios" }.should route_to(:controller => "scenarios", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/scenarios/new" }.should route_to(:controller => "scenarios", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/scenarios/1" }.should route_to(:controller => "scenarios", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/scenarios/1/edit" }.should route_to(:controller => "scenarios", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/scenarios" }.should route_to(:controller => "scenarios", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/scenarios/1" }.should route_to(:controller => "scenarios", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/scenarios/1" }.should route_to(:controller => "scenarios", :action => "destroy", :id => "1")
    end

  end
end
