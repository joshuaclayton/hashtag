RSpec.configure do |config|
  config.before do
    FakeTwitter.clear
  end
end
