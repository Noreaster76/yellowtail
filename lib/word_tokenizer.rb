module WordTokenizer

  def self.tokenize(text)
    if text.nil?
      []
    else
      text.gsub(/[^'\w\s]/,'').
        split(' ').
        reject(&:empty?).
        reject { |word| word.match(/[\d]/) }
    end
  end

end
