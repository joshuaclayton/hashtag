require 'spec_helper'

feature 'View the homepage' do
  scenario 'gather information about the site' do
    visit root_path
    page.should have_css('title', text: 'Hashtag')
  end
end
