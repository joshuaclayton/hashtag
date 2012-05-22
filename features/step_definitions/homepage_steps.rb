When /^I go to the homepage$/ do
  visit root_path
end

Then /^I should be able to enter a search term for Twitter$/ do
  page.should have_css('input.search[type=text]')
end
