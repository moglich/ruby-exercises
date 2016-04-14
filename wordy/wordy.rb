class WordProblem

  def initialize(question)
    @question = question
  end

  def answer
    calculate(extract_calculation(@question))
  end

  private
  
  def extract_calculation(question)
    calculation = []

    words = question.split
    
    words.each do |word|
      case word
      when "plus"
        then calculation << '+'
      when "minus"
        then calculation << '-'
      when "multiplied"
        then calculation << '*'
      when "divided"
        then calculation << '/'
      when "cubed?"
        then raise ArgumentError
      else
        if word.to_i != 0
          calculation << word.to_i
        end
      end
    end

    raise ArgumentError if calculation == []

    calculation
  end

  def calculate(calculation)
    numbers = []
    operators = []

    calculation.each_with_index do |value, idx|
      if idx.even?
        numbers << value
      else
        operators << value
      end
    end

    until numbers.empty? do
      result = numbers.shift.send(operators.shift, numbers.shift)
      unless numbers.empty?
        numbers.unshift(result)
      end
    end

    result
  end
end
