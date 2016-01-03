module WordTokenizer

  def self.tokenize(text)
    text.nil? ? [] : text.split(' ').reject(&:empty?)
  end

end
