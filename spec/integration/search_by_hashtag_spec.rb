require 'spec_helper'

feature 'Search by a term' do
  scenario 'redirects to the correct path' do
    visit_homepage
    search_for 'ruby'
    user_sees_results_for 'ruby'
  end

  def search_for(term)
    fill_in 'Search term', with: term
    click_button 'Search'
  end

  def user_sees_results_for(term)
    expect(current_path).to eq "/searches/#{term}"
    expect(page).to have_css 'h1', text: "##{term}"
    expect(all('.tweet').count).to eq 15
  end
end
