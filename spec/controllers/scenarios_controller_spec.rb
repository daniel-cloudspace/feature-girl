require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe ScenariosController do

  def mock_scenario(stubs={})
    @mock_scenario ||= mock_model(Scenario, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all scenarios as @scenarios" do
      Scenario.stub(:all) { [mock_scenario] }
      get :index
      assigns(:scenarios).should eq([mock_scenario])
    end
  end

  describe "GET show" do
    it "assigns the requested scenario as @scenario" do
      Scenario.stub(:find).with("37") { mock_scenario }
      get :show, :id => "37"
      assigns(:scenario).should be(mock_scenario)
    end
  end

  describe "GET new" do
    it "assigns a new scenario as @scenario" do
      Scenario.stub(:new) { mock_scenario }
      get :new
      assigns(:scenario).should be(mock_scenario)
    end
  end

  describe "GET edit" do
    it "assigns the requested scenario as @scenario" do
      Scenario.stub(:find).with("37") { mock_scenario }
      get :edit, :id => "37"
      assigns(:scenario).should be(mock_scenario)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created scenario as @scenario" do
        Scenario.stub(:new).with({'these' => 'params'}) { mock_scenario(:save => true) }
        post :create, :scenario => {'these' => 'params'}
        assigns(:scenario).should be(mock_scenario)
      end

      it "redirects to the created scenario" do
        Scenario.stub(:new) { mock_scenario(:save => true) }
        post :create, :scenario => {}
        response.should redirect_to(scenario_url(mock_scenario))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved scenario as @scenario" do
        Scenario.stub(:new).with({'these' => 'params'}) { mock_scenario(:save => false) }
        post :create, :scenario => {'these' => 'params'}
        assigns(:scenario).should be(mock_scenario)
      end

      it "re-renders the 'new' template" do
        Scenario.stub(:new) { mock_scenario(:save => false) }
        post :create, :scenario => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested scenario" do
        Scenario.stub(:find).with("37") { mock_scenario }
        mock_scenario.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scenario => {'these' => 'params'}
      end

      it "assigns the requested scenario as @scenario" do
        Scenario.stub(:find) { mock_scenario(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:scenario).should be(mock_scenario)
      end

      it "redirects to the scenario" do
        Scenario.stub(:find) { mock_scenario(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(scenario_url(mock_scenario))
      end
    end

    describe "with invalid params" do
      it "assigns the scenario as @scenario" do
        Scenario.stub(:find) { mock_scenario(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:scenario).should be(mock_scenario)
      end

      it "re-renders the 'edit' template" do
        Scenario.stub(:find) { mock_scenario(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested scenario" do
      Scenario.stub(:find).with("37") { mock_scenario }
      mock_scenario.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the scenarios list" do
      Scenario.stub(:find) { mock_scenario }
      delete :destroy, :id => "1"
      response.should redirect_to(scenarios_url)
    end
  end

end
