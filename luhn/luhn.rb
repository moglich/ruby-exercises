class Luhn
  def initialize(number)
    @digits = number.to_s.chars.map(&:to_i)
  end

  def addends
    @digits.reverse.each_with_index.map do |d, idx|
      if idx.odd?
        d *= 2
        if d >= 10
          d -= 9
        end
        d
      else
        d
      end
    end.reverse
  end

  def checksum
    self.addends.inject(:+)
  end

  def valid?
    (self.checksum % 10) == 0 ? true : false
  end

  def self.create(number)
    if new(number*10).valid?
      number * 10
    else
      remainder = new(number*10).checksum % 10
      number * 10 + (10 - remainder)
    end
  end
end

