require 'sinatra'
require 'json'

Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }

before do
  request.body.rewind
  @request_json = JSON.parse(request.body.read)['text']
end

post '/words/avg_len' do
  AverageLength.calculate(LettersOnlyFilter.filter(WordTokenizer.tokenize(@request_json))).to_s
end

post '/sentences/avg_len' do
  sentences = SentenceTokenizer.tokenize(@request_json)
  words_per_sentence = sentences.map { |sentence| WordTokenizer.tokenize(sentence) }
  AverageLength.calculate(words_per_sentence).to_s
end
