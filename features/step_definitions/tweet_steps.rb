When /^I search for the hashtag "(.*?)"$/ do |hashtag|
  step %{I go to the homepage}
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

Given /^Twitter returns the following tweets for the search term "(.*?)":$/ do |search_term, table|
  Searcher.search_object = FakeTwitter
  FakeTwitter.register_results(search_term, table.hashes)
end

Then /^I should see (\d+) tweets$/ do |count|
  all('ul.tweets li').count.should == count.to_i
end
