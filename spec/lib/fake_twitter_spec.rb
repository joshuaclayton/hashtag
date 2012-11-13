require 'spec_helper'

describe FakeTwitter, 'faking searches and results' do
  it 'returns responses to search based on assigned data' do
    FakeTwitter['#term'] = [
      { text: 'foo' },
      { text: 'bar' }
    ]

    expect(FakeTwitter.search('#term').results.length).to eq 2
  end

  it 'allows results to be cleared' do
    FakeTwitter['#term'] = [ { text: 'foo' } ]
    FakeTwitter.clear

    expect(FakeTwitter.search('#term').results.length).to eq 0
  end

  it 'returns Twitter::Status instances with the correct data' do
    FakeTwitter['#term'] = [
      { text: 'foo' },
      { text: 'bar' }
    ]

    FakeTwitter.search('#term').results.each_with_index do |result, index|
      expect(result).to be_a Twitter::Status
      expect(result.text).to eq FakeTwitter['#term'][index][:text]
    end
  end
end
