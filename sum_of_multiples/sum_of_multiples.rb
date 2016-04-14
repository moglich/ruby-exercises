class SumOfMultiples

  def initialize(*args)
    @multiplicators = args
  end

  def to(limit)
    SumOfMultiples.to(@multiplicators, limit)
  end

  def self.to(multi = nil, limit)
    @multiplicators = multi
    @multiplicators ||= [3, 5]
    sum = []
    sum = [0] if limit < 3
    @multiplicators.each do |number|
      actual_number = number
      while actual_number < limit
        unless sum.include? actual_number
          sum << actual_number
        end
          actual_number += number
      end
    end
    sum.reduce(:+)
  end

end
