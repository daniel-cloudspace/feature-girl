require 'spec_helper'

describe "features/index.html.haml" do
  before(:each) do
    assign(:features, [
      stub_model(Feature,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Feature,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of features" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
