require 'sinatra'

get '/' do
  'Hello, World!'
end

post '/words/avg_len' do
  AverageLength.calculate request.body
end
