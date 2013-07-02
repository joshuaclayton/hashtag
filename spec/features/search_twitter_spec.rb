require 'spec_helper'

feature 'Search twitter' do
  scenario 'displays tweets' do
    visit root_path

    fill_in 'Search term', with: '#rails'
    click_on 'Search'

    expect(current_path).to eq '/searches/rails'

    within 'ul' do
      expect(page).to have_css 'li', text: /#rails/i, count: 15
    end
  end

  scenario 'displays tweets with a hashtag even if the term does not contain one' do
    visit root_path

    fill_in 'Search term', with: 'rails'
    click_on 'Search'

    expect(current_path).to eq '/searches/rails'

    within 'ul' do
      expect(page).to have_css 'li', text: /#rails/i, count: 15
    end
  end

  scenario 'allows for updating search term' do
    visit root_path

    fill_in 'Search term', with: 'rails'
    click_on 'Search'

    within 'ul' do
      expect(page).to have_css 'li', text: /#rails/i, count: 15
    end

    fill_in 'Search term', with: 'ruby'
    click_on 'Search'

    within 'ul' do
      expect(page).to have_css 'li', text: /#ruby/i, count: 15
    end
  end
end
