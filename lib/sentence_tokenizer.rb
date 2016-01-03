module SentenceTokenizer

  def self.tokenize(text)
    if text.nil?
      []
    else
      text.split(/[\.!]/).map(&:strip).reject(&:empty?)
    end
  end

end
