require 'spec_helper'

describe Searcher, '#results' do
  it 'searches on Twitter with the instantiated search term' do
    search_response = stub('search', results: [])
    Twitter.stubs(search: search_response)
    searcher = Searcher.new('#ruby-on-rails')
    searcher.results
    expect(Twitter).to have_received(:search).with('#ruby-on-rails')
  end

  it 'returns results from the search response' do
    search_response = stub('search', results: [1234])
    Twitter.stubs(search: search_response)
    searcher = Searcher.new('#ruby-on-rails')
    expect(searcher.results).to eq search_response.results
  end
end
