require File.expand_path '../../spec_helper.rb', __FILE__

describe 'Yellowtail main app' do
  it 'allows accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'returns the average word length from /words/avg_len' do
    post '/words/avg_len', "{\"text\":\"My cat is grey. It doesn\'t have feathers.\"}"
    expect(last_response.body).to eq '3.875'
  end
end

