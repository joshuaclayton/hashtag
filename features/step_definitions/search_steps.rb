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

Given /^Twitter returns the following results when searching for "(.*?)":$/ do |search_term, table|
  require 'fake_twitter'
  Search.search_api = FakeTwitter
  FakeTwitter[search_term] = table.hashes
end

Then /^I should see (\d+) tweets containing the hashtag "(.*?)"$/ do |tweet_count, hashtag|
  within 'ul.tweets' do
    puts all('li').count
    tweets_matching_hashtag = all('li').select do |node|
      node.text =~ /#{hashtag}/i
    end

    expect(tweets_matching_hashtag.count).to eq tweet_count.to_i
  end
end

Then /^I should see (\d+) tweets$/ do |tweet_count|
  expect(all('ul.tweets li').count).to eq tweet_count.to_i
end
