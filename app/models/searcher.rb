class Searcher
  class_attribute :search_api
  self.search_api = Twitter

  include Enumerable

  def initialize(search_term)
    @items = search_api.search(search_term).results
  end

  def each(&block)
    @items.each &block
  end
end
