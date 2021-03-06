class RunLengthEncoding
  def self.encode(input)
    input.gsub(/((.)\2*)/) { $1.size == 1 ? $2 : $1.size.to_s + $2 }
  end

  def self.decode(input)
    input.gsub(/(\d+)(.)/) { $2 * $1.to_i }
  end
end
