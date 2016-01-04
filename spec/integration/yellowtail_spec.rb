require File.expand_path '../../spec_helper.rb', __FILE__

describe 'Yellowtail main app' do

  describe '/words/avg_len' do
    it 'returns the average word length' do
      post '/words/avg_len', "{\"text\":\"My cat is grey. It doesn\'t have feathers.\"}"
      expect(last_response.body).to eq '3.875'
    end
  end

  describe '/sentences/avg_len' do
    it 'returns the average sentence length' do
      post '/sentences/avg_len', "{\"text\":\"My cat's fluffy. He's a lazy potato sack.\"}"
      expect(last_response.body).to eq '4.0'
    end
  end

end

