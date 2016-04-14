class SumOfMultiples

  def initialize(*args)
    @multiplicators = args
  end

  def to(limit)
    self.class.to(@multiplicators, limit)
  end

  def self.to(multiplicators = [3, 5], limit)
    @multiplicators = multiplicators
    sum = []
    @multiplicators.each do |number|
      actual_number = number
      while actual_number < limit
        unless sum.include? actual_number
          sum << actual_number
        end
          actual_number += number
      end
    end
    sum.reduce(0, :+)
  end

end
