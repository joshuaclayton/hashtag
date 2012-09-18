RSpec.configure do |config|
  config.around do |example|
    old_search_api = Searcher.search_api
    example.run # may change search_api
    Searcher.search_api = old_search_api
  end
end
