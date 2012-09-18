require 'spec_helper'

feature 'View the homepage' do
  scenario 'gather information about the site' do
    visit_homepage
    page_should_be_titled 'Hashtag'
  end

  def page_should_be_titled(text)
    page.should have_css('title', text: text)
  end
end
