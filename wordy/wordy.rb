class WordProblem
  attr_accessor :question

  def initialize(question)
    @question = question
  end

  def answer
    words = @question.split
    calculation = []
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

    if calculation.length == 3
      calculation[0].send calculation[1], calculation[2]
    else
      result1 = calculation[0].send calculation[1], calculation[2]
      result1.send calculation[3], calculation[4]
    end
  end
end
