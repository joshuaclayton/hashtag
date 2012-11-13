require 'spec_helper'

feature 'Search twitter by hashtag', js: true do
  scenario 'search via a form' do
    visit root_path
    search_for 'Rails'
    page_should_have_tweets_tagged('rails', 15)
  end

  scenario 'search via a URL' do
    visit '/searches/rails'
    page_should_have_tweets_tagged('rails', 15)
  end

  scenario 'search with known responses' do
    twitter_responds_to_search('#Rails').with [
      { text: '#rails is awesome', from_user_name: 'joshuaclayton' },
      { text: '#rails is cool', from_user_name: 'joshuaclayton' },
      { text: 'I love #RAILS', from_user_name: 'joshuaclayton' }
    ]

    visit root_path
    search_for 'Rails'
    page_should_have_tweets_tagged('rails', 3, from_user_name: 'joshuaclayton')
  end

  def twitter_responds_to_search(term)
    Searcher.driver = FakeTwitter

    Class.new(Struct.new(:term)) do
      def with(array_of_tweets)
        FakeTwitter[term] = array_of_tweets
      end
    end.new(term)
  end

  def page_should_have_tweets_tagged(tag, count, options = {})
    expect(page).to have_css 'li', text: /##{tag}/i, count: count

    if options[:from_user_name]
      expect(page).to have_css 'li span.author', text: options[:from_user_name]
    end
  end

  def search_for(term)
    fill_in 'Search', with: term
    click_button 'Search'
  end
end
