class RunLengthEncoding
  def self.encode(input)
    output = []
    char_count = 1

    input.chars.each_with_index do |char, idx|
      if input[idx + 1] == char
        char_count += 1
      else
        output << char_count if char_count > 1
        output << char
        char_count = 1
      end
    end

    output.join
  end

  def self.decode(input)
    output = []
    char_count = 0

    input.chars.each_with_index do |char, idx|
      if /\d/.match char
        if /\d/.match input[idx + 1]
          char_count = (char_count + char.to_i) * 10
        else
          char_count = char_count + char.to_i
        end
        #require 'pry'; binding.pry
      else
        if char != input[idx + 1] && char_count == 0
          char_count = 1
        end
        output << (char * char_count)
        char_count = 0
      end
    end

    output.join
  end
end
