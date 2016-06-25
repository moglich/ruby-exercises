class RunLengthEncoding
  def self.encode(input)
    input.gsub(/((.)\2*)/) do |part|
      part.size == 1 ? part[0] : (part.size.to_s + part[0])
    end
  end

  def self.decode(input)
    input.gsub(/\d*./) do |part|
      count = part.match(/\d*/)[0].to_i
      count == 0 ? part : part.match(/[^\d]/).to_s * count
    end
  end
end
