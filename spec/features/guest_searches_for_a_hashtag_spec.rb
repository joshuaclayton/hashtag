require 'spec_helper'

feature 'Guest searches for a hashtag' do
  scenario 'displays search results' do
    search_for '#rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'displays known information' do
    Searcher.backend = FakeTwitter

    FakeTwitter['#rails'] = 5.times.map do
      { text: 'I love #rails' }
    end

    search_for '#rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: 'I love #rails', count: 5
  end

  scenario 'searches without a hashtag' do
    search_for 'rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'updates search results' do
    search_for '#rails'

    fill_in 'Search', with: '#ruby'
    click_on 'Submit'

    expect(current_path).to eq '/searches/ruby'
    expect(page).to have_css 'li', text: /#ruby/i, count: 15
  end

  def search_for(term)
    visit root_path
    fill_in 'Search', with: term
    click_on 'Submit'
  end
end
