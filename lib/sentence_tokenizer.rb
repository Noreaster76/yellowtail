module SentenceTokenizer

  def self.tokenize(text)
    text.nil? ? [] : text.split(/[\.!?]/).map(&:strip).reject(&:empty?)
  end

end
