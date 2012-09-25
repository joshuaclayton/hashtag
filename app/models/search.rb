class Search
  def initialize(search_term)
    @search_term = search_term
  end

  def each(&block)
    Twitter.search(@search_term).results.each(&block)
  end
end
