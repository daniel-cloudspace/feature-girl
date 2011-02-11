require "spec_helper"

describe TagsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tagzs" }.should route_to(:controller => "tagzs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tagzs/new" }.should route_to(:controller => "tagzs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tagzs/1" }.should route_to(:controller => "tagzs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tagzs/1/edit" }.should route_to(:controller => "tagzs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tagzs" }.should route_to(:controller => "tagzs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tagzs/1" }.should route_to(:controller => "tagzs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tagzs/1" }.should route_to(:controller => "tagzs", :action => "destroy", :id => "1")
    end

  end
end
