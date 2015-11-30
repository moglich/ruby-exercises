class Luhn
  attr_accessor :checksum

  def initialize(number)
    @number = number
  end

  def self.create(number)
    out = number.to_s.chars.reverse.each_with_index.map do |n, idx|
      n = n.to_i
      if (idx % 2) == 0 
        n *= 2
        if n >= 10
          n -= 9
        end
        n
      else
        n
      end
    end.reverse 
    number = (number * 10)
    if (out.inject(:+) % 10) == 0
      number
    else
      number + 10 - out.inject(:+) % 10
    end
  end

  def addends
    @number.to_s.chars.reverse.each_with_index.map do |n, idx|
      n = n.to_i
      if (idx % 2) != 0 
        n *= 2
        if n >= 10
          n -= 9
        end
        n
      else
        n
      end
    end.reverse 
  end

  def checksum
    self.addends.inject(:+)
  end

  def valid?
    (self.checksum % 10) == 0 ? true : false
  end
end
