module AverageWordLength

  def self.calculate(text)
    result = 0
    unless text.nil?
      all_words = text.split(' ')
      unless all_words.empty?
        result = all_words.map(&:length).inject(:+) / Float(all_words.count)
      end
    end
    result
  end

end
