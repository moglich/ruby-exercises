class RunLengthEncoding
  def self.encode(input)
    input.gsub(/((.)\2*)/) { |part| part.size == 1 ? $2 : part.size.to_s + $2 }
  end

  def self.decode(input)
    input.gsub(/(\d*)(.)/) { $1.to_i == 0 ? $2 : $2 * $1.to_i }
  end
end
