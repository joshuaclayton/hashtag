When /^I search for the hashtag "(.*?)"$/ do |hashtag|
  visit root_path
  fill_in 'Search', with: hashtag
  click_button 'Search'
end

Then /^I should see tweets containing the hashtag "(.*?)"$/ do |hashtag|
  within 'ul.tweets' do
    expect(all('li').count).to_not be_zero
    all('li').each do |node|
      expect(node.text).to match /##{hashtag}/i
    end
  end
end
