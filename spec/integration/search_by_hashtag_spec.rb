require 'spec_helper'

feature 'Search by a term' do
  scenario 'redirects to the correct path' do
    visit_homepage
    search_for 'ruby'
    user_sees_results_for 'ruby'
    user_sees_correct_number_of_tweets 15
  end

  scenario 'verify the correct tweets are displayed' do
    tweets = 2.times.map { { text: 'twitter is cool', from_user_name: 'joshuaclayton' } }
    Searcher.search_api = FakeTwitter.new(tweets)
    visit_homepage
    search_for 'twitter'
    user_sees_results_for 'twitter'
    user_sees_correct_number_of_tweets 2
    user_sees_tweet_author 'joshuaclayton'
  end

  def user_sees_tweet_author(name)
    expect(find('.tweet-author').text).to eq name
  end

  def search_for(term)
    fill_in 'Search term', with: term
    click_button 'Search'
  end

  def user_sees_results_for(term)
    expect(current_path).to eq "/searches/#{term}"
    expect(page).to have_css 'h1', text: "##{term}"
  end

  def user_sees_correct_number_of_tweets(count)
    expect(all('.tweet').count).to eq count
  end
end
