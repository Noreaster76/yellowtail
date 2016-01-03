require File.expand_path '../../spec_helper.rb', __FILE__

describe 'Yellowtail main app' do
  it 'routes /words/avg_len to the WordTokenizer and AverageLength module' do
    tokenized_output = double('tokenized text')
    expect(WordTokenizer).to receive(:tokenize).with("My cat is grey. It doesn't have feathers.").and_return tokenized_output
    filtered_tokens = double('tokenized and filtered text')
    expect(RemoveIrrelevantCharactersFilter).to receive(:filter).with(tokenized_output).and_return filtered_tokens
    expect(AverageLength).to receive(:calculate).with filtered_tokens
    post '/words/avg_len', "{\"text\":\"My cat is grey. It doesn\'t have feathers.\"}"
  end
end

