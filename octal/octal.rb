class Octal
  def initialize(number)
    if number.match(/\D|8|9/)
      number = 0
    end
    @digits = number.to_s.chars.map(&:to_i)
  end

  def to_decimal
    decimal_number = 0
    @digits.reverse.each_with_index do |number, idx|
      decimal_number += number * (8 ** idx)
    end
    decimal_number
  end
end
