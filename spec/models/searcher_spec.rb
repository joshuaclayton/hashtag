require 'spec_helper'

describe Searcher do
  it 'returns results' do
    searcher = Searcher.new('#rails')
    stubbed_search = stub('search', results: [stub('tweet', text: 'I love #rails')])
    stubbed_backend = stub('CustomBackend', search: stubbed_search)
    searcher.backend = stubbed_backend

    results = []

    searcher.each do |tweet|
      results << tweet.text
    end

    expect(results).to eq ['I love #rails']
    expect(searcher.length).to eq 1
    expect(stubbed_backend).to have_received(:search).with(anything).once
  end
end
