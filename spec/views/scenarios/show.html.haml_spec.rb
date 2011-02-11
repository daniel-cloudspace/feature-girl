require 'spec_helper'

describe "scenarios/show.html.haml" do
  before(:each) do
    @scenario = assign(:scenario, stub_model(Scenario,
      :title => "Title",
      :steps => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
