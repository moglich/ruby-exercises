class Anagram
  def initialize(origin_word)
    @origin_word = origin_word
  end

  def match(words)
    anagrams = []

    words.each do |word|
      if word.length == @origin_word.length
        if word.downcase.chars.sort == @origin_word.downcase.chars.sort
          unless word.downcase == @origin_word.downcase
            anagrams << word
          end
        end
      end
    end

    anagrams
  end
end

