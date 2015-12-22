class Octal
  def initialize(octal_number)
    @octal_digits = octal_number.chars.map(&:to_i) unless octal_number.match(/\D|8|9/)
  end

  def to_decimal
    return 0 unless @octal_digits

    @octal_digits.reverse.map.with_index do |number, idx|
      number * (8 ** idx)
    end.reduce(:+)
  end
end
