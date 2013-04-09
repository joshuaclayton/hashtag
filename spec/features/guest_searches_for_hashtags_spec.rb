require 'spec_helper'

feature 'Guest searches for hashtags', :js do
  scenario 'without a hashtag' do
    search_for 'rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'with a hashtag' do
    search_for '#rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'with specific results from Twitter' do
    set_twitter_results_for('#rails') do
      5.times.map do
        { text: 'I <3 #rails' }
      end
    end

    search_for '#rails'

    expect(page).to have_css 'li', text: 'I <3 #rails', count: 5
  end

  def search_for(term)
    visit root_path
    fill_in 'Search', with: term
    click_on 'Submit'
  end

  def set_twitter_results_for(term)
    Searcher.backend = FakeTwitter
    FakeTwitter[term] = yield
  end

  before do
    FakeTwitter.clear
  end

  around do |example|
    cached_backend = Searcher.backend
    example.run
    Searcher.backend = cached_backend
  end
end
