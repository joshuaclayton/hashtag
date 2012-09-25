require 'spec_helper'
require 'fake_twitter'

describe FakeTwitter do
  it 'returns results for the correct search term' do
    FakeTwitter['foo'] = [{ text: 'i love foo' }]
    expect(FakeTwitter.search('foo').results.map(&:text)).to eq ['i love foo']
  end
end
