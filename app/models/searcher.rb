class Searcher
  include Enumerable

  def initialize(search_term)
    @items = Twitter.search(search_term).results
  end

  def each(&block)
    @items.each &block
  end
end
