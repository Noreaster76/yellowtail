require 'sinatra'
require 'json'

get '/' do
  'Hello, World!'
end

post '/words/avg_len' do
  body = JSON.parse(request.body.string)['text']
  AverageWordLength.calculate body
end
