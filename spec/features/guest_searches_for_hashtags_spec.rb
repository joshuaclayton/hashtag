require 'spec_helper'

feature 'Guest searches for hashtags' do
  scenario 'without a hashtag' do
    visit root_path
    fill_in 'Search', with: 'rails'
    click_on 'Submit'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /rails/i, count: 15
  end

  scenario 'with a hashtag' do
    visit root_path
    fill_in 'Search', with: '#rails'
    click_on 'Submit'

    expect(current_path).to eq '/searches/rails'
    expect(page).to have_css 'li', text: /rails/i, count: 15
  end
end
