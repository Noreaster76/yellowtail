require 'sinatra'
require 'json'

post '/words/avg_len' do
  body = JSON.parse(request.body.string)['text']
  result = AverageLength.calculate(RemoveIrrelevantCharactersFilter.filter(WordTokenizer.tokenize(body)))
  result.to_s
end

post '/sentences/avg_len' do
  body = JSON.parse(request.body.string)['text']
  result = AverageLength.calculate(SentenceTokenizer.tokenize(body))
  result.to_s
end
