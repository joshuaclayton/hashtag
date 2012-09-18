require 'spec_helper'

describe Searcher, 'each' do
  it 'iterates over each search result' do
    searcher = Searcher.new('#ruby')

    searcher.each do |result|
      expect(result.text).to match /#ruby/i
    end

    expect(searcher.count).to eq 15
  end
end
