class Searcher
  class_attribute :search_object
  self.search_object = Twitter

  def initialize(search_term)
    @search_term = search_term
  end

  def search
    search_object.search(@search_term)
  end
end
