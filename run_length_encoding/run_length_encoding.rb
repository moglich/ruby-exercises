class RunLengthEncoding
  def self.encode(input)
    input.gsub(/((.)\2*)/) do |part|
      part.size == 1 ? $2 : part.size.to_s + $2
    end
  end

  def self.decode(input)
    input.gsub(/(\d*)(.)/) do
      $1.to_i == 0 ? $2 : $2 * $1.to_i
    end
  end
end
