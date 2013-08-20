require 'spec_helper'

describe Searcher, '#each' do
  it 'yields the block passed' do
    results = Class.new do
      def each(&block)
        block.call
      end
    end.new

    search = double('search', results: results)
    Twitter.stub(:search).and_return(search)

    searcher = Searcher.new('#ruby')

    block_called = false
    searcher.each { block_called = true }

    expect(block_called).to be_true
  end

  it 'calls #each on Twitter search results' do
    results = double('results', each: nil)
    search = double('search', results: results)
    Twitter.stub(:search).and_return(search)

    searcher = Searcher.new('#ruby')

    block_called = false
    searcher.each { block_called = true }

    expect(results).to have_received(:each)
    expect(Twitter).to have_received(:search).with('#ruby')
  end
end
