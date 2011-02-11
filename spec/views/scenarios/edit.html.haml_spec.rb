require 'spec_helper'

describe "scenarios/edit.html.haml" do
  before(:each) do
    @scenario = assign(:scenario, stub_model(Scenario,
      :title => "MyString",
      :steps => "MyText"
    ))
  end

  it "renders the edit scenario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scenarios_path(@scenario), :method => "post" do
      assert_select "input#scenario_title", :name => "scenario[title]"
      assert_select "textarea#scenario_steps", :name => "scenario[steps]"
    end
  end
end
