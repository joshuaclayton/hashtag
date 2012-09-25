require 'spec_helper'

describe Search do
  it 'iterates over each result from Twitter' do
    results = stub('twitter results', results: [])
    Twitter.stubs(search: results)
    searcher = Search.new('search term')

    searcher.each { }
    expect(Twitter).to have_received(:search).with('search term')
  end
end
