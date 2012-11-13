class Searcher
  class_attribute :driver
  self.driver = Twitter

  include Enumerable

  def initialize(term)
    @results = driver.search(term).results
  end

  def each(&block)
    @results.each(&block)
  end

  def length
    @results.length
  end
end
