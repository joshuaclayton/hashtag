require 'spec_helper'

describe FakeTwitter do
  context '.register_results' do
    it 'registers results correctly based on term and tweets' do
      FakeTwitter.register_results('#rails', [{ text: 'I love #rails' }])
      FakeTwitter.results.should == { '#rails' => [Twitter::Status.new({ text: 'I love #rails' })] }
    end

    it 'registers multiple results correctly' do
      FakeTwitter.register_results('#ruby', [{ text: 'I love #ruby' }])
      FakeTwitter.register_results('#tdd', [{ text: 'I love #tdd' }])

      FakeTwitter.results.should == {
        '#ruby' => [Twitter::Status.new({ text: 'I love #ruby' })],
        '#tdd' => [Twitter::Status.new({ text: 'I love #tdd' })]
      }
    end
  end

  context '.clear_results' do
    it 'removes all results from FakeTwitter' do
      FakeTwitter.register_results('#ruby', [{ text: 'I love #ruby' }])
      FakeTwitter.clear_results
      FakeTwitter.results.should be_nil
    end
  end

  context '.search' do
    it 'returns the array of tweets when the term exists' do
      FakeTwitter.register_results('#ruby', [{ text: 'I love #ruby' }])
      FakeTwitter.search('#ruby').should == [Twitter::Status.new({ text: 'I love #ruby' })]
    end

    it 'returns an empty array of tweets when the term does not exist' do
      FakeTwitter.register_results('#ruby', [{ text: 'I love #ruby' }])
      FakeTwitter.search('#rails').should == []
    end
  end
end
