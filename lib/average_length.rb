module AverageLength

  def self.calculate(input)
    input.empty? ? 0 : input.map(&:length).inject(:+) / Float(input.count)
  end

end
