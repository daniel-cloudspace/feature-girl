Given /^the following scenarios:$/ do |scenarios|
  Scenario.create!(scenarios.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) scenario$/ do |pos|
  visit scenarios_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following scenarios:$/ do |expected_scenarios_table|
  expected_scenarios_table.diff!(tableish('table tr', 'td,th'))
end

Then /^I should see that scenario listed$/ do
  @scenario = Scenario.last
  page.should have_content(@scenario.title)
end
