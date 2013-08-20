RSpec.configure do |config|
  config.around do |example|
    cache_searcher_backend = Searcher.backend
    example.run
    Searcher.backend = cache_searcher_backend
  end
end
