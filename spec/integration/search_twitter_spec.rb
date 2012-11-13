require 'spec_helper'

feature 'Search twitter by hashtag' do
  scenario 'search via a form' do
    visit root_path
    search_for 'Rails'
    page_should_have_tweets_tagged('rails', 15)
  end

  scenario 'search via a URL' do
    visit '/searches/ruby'
    page_should_have_tweets_tagged('ruby', 15)
  end

  def page_should_have_tweets_tagged(tag, count)
    expect(page).to have_css 'li', text: /##{tag}/i, count: count
  end

  def search_for(term)
    fill_in 'Search', with: term
    click_button 'Search'
  end
end
