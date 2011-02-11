require "spec_helper"

describe FeaturesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/features" }.should route_to(:controller => "features", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/features/new" }.should route_to(:controller => "features", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/features/1" }.should route_to(:controller => "features", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/features/1/edit" }.should route_to(:controller => "features", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/features" }.should route_to(:controller => "features", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/features/1" }.should route_to(:controller => "features", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/features/1" }.should route_to(:controller => "features", :action => "destroy", :id => "1")
    end

  end
end
