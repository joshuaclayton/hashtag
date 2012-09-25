class Search
  class_attribute :search_api
  self.search_api = Twitter

  def initialize(search_term)
    @search_term = search_term
  end

  def each(&block)
    search_api.search(@search_term).results.each(&block)
  end
end
