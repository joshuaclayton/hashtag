Around do |scenario, block|
  cached_search_api = Search.search_api
  block.call
  Search.search_api = cached_search_api
end
