Given /^the following features:$/ do |features|
  Feature.create!(features.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) feature$/ do |pos|
  visit features_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following features:$/ do |expected_features_table|
  expected_features_table.diff!(tableish('table tr', 'td,th'))
end

Then /^I should see that feature listed$/ do
  @feature = Feature.last
  page.should have_content(@feature.title)
end
