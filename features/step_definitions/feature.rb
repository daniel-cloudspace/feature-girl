Then /^I should see that feature listed$/ do
  @feature = Feature.last
  page.should have_content(@feature.title)
end

