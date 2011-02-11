require 'spec_helper'

describe "features/new.html.haml" do
  before(:each) do
    assign(:feature, stub_model(Feature,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => features_path, :method => "post" do
      assert_select "input#feature_title", :name => "feature[title]"
      assert_select "textarea#feature_description", :name => "feature[description]"
    end
  end
end
