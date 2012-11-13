require 'spec_helper'

feature 'Search twitter by hashtag' do
  scenario 'search via a form' do
    visit root_path
    fill_in 'Search', with: 'Rails'
    click_button 'Search'
    expect(page).to have_css 'li', text: /#rails/i, count: 15
  end

  scenario 'search via a URL' do
    visit '/searches/ruby'
    expect(page).to have_css 'li', text: /#ruby/i, count: 15
  end
end
