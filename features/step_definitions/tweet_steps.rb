When /^search for the hashtag "(.*?)"$/ do |hashtag|
  fill_in 'search_term', with: hashtag
  click_button 'Search'
end

Then /^I should see tweets with the hashtag "(.*?)"$/ do |hashtag|
  tweets = all('ul.tweets li')
  tweets.count.should > 0

  tweets.each do |tweet_li|
    tweet_li.text.should =~ /#{hashtag}/i
  end
end
