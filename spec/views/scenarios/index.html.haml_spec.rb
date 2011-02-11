require 'spec_helper'

describe "scenarios/index.html.haml" do
  before(:each) do
    assign(:scenarios, [
      stub_model(Scenario,
        :title => "Title",
        :steps => "MyText"
      ),
      stub_model(Scenario,
        :title => "Title",
        :steps => "MyText"
      )
    ])
  end

  it "renders a list of scenarios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
