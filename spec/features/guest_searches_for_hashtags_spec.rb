require 'spec_helper'

feature 'Guest searches for hashtags' do
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

  def search_for(term)
    visit root_path
    fill_in 'Search', with: term
    click_on 'Submit'
  end
end
