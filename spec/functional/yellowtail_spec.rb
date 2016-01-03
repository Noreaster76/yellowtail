require File.expand_path '../../spec_helper.rb', __FILE__

describe 'Yellowtail main app' do
  it 'allows accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'routes /words/avg_len to the AverageWordLength module' do
    expect(AverageWordLength).to receive(:calculate).with "My cat is gray. It doesn't have feathers."
    post '/words/avg_len', "{\"text\":\"My cat is gray. It doesn\'t have feathers.\"}"
  end
end

