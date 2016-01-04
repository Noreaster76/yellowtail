require 'sinatra'
require 'json'

before do
  request.body.rewind
  @request_json = JSON.parse(request.body.read)['text']
end

post '/words/avg_len' do
  result = AverageLength.calculate(RemoveIrrelevantCharactersFilter.filter(WordTokenizer.tokenize(@request_json)))
  result.to_s
end

post '/sentences/avg_len' do
  result = AverageLength.calculate(SentenceTokenizer.tokenize(@request_json))
  result.to_s
end
