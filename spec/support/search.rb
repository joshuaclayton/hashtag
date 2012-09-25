RSpec.configure do |config|
  config.around do |test|
    cached_search_api = Search.search_api
    test.run
    Search.search_api = cached_search_api
  end
end
