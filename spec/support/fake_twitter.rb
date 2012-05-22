RSpec.configure do |config|
  config.after do
    FakeTwitter.clear_results
  end
end
