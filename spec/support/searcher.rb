RSpec.configure do |config|
  config.around do |example|
    cached_searcher_driver = Searcher.driver
    example.run
    Searcher.driver = cached_searcher_driver
  end
end
