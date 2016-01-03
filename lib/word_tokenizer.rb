module WordTokenizer

  def self.tokenize(text)
    text.nil? ? [] : text.split(' ').reject(&:empty?).reject { |word| word.match(/[\d]/) }
  end

end
