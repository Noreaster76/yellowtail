module LettersOnlyFilter

  def self.filter(input)
    input.map { |element| element.gsub(/[^\w]/, '') }
  end

end
