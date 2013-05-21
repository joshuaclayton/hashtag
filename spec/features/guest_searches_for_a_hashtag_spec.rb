require 'spec_helper'

feature 'Guest searches for a hashtag' do
  scenario 'displays search results' do
    search_for '#rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'displays known information' do
    search_fake_twitter '#rails', 5.times.map { { text: 'I love #rails', from_user: 'ImTheAuthor' } }
    search_for '#rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: 'I love #rails', count: 5
    expect(page).to have_css '.author', text: 'ImTheAuthor', count: 5
  end

  scenario 'searches without a hashtag' do
    search_fake_twitter '#rails', 15.times.map { { text: 'I love #rails' } }
    search_for 'rails'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'updates search results' do
    search_fake_twitter '#ruby', 15.times.map { { text: 'I love #ruby' } }
    search_for '#rails'

    fill_in 'Search', with: '#ruby'
    click_on 'Submit'

    expect(current_path).to eq '/searches/ruby'
    expect(page).to have_css 'li', text: /#ruby/i, count: 15
  end

  def search_fake_twitter(term, results)
    Searcher.backend = FakeTwitter

    FakeTwitter[term] = results
  end

  def search_for(term)
    visit root_path
    fill_in 'Search', with: term
    click_on 'Submit'
  end
end
