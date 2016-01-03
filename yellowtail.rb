require 'sinatra'
require 'json'

get '/' do
  'Hello, World!'
end

post '/words/avg_len' do
  body = JSON.parse(request.body.string)['text']
  result = AverageLength.calculate(RemoveIrrelevantCharactersFilter.filter(WordTokenizer.tokenize(body)))
  result.to_s
end
