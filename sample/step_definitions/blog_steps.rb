Given /^a post with title "(.+)" and body "(.+)"$/ do |title, body|
  Post.create( {
    :title => title,
    :body => "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
  } )
  #debugger
end

Then /^I will confirm on next step$/ do
  begin
    evaluate_script("window.alert = function(msg) { return true; }")
    evaluate_script("window.confirm = function(msg) { return true; }")
  rescue
    Capybara::NotSupportedByDriverError
  end
end
