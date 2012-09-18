module HomepageHelper
  def visit_homepage
    visit root_path
  end
end

RSpec.configure do |config|
  config.include HomepageHelper
end
