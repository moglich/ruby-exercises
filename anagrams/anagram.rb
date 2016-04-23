class Anagram
  def initialize(origin_word)
    @origin_word = origin_word
  end

  def match(words)
    anagrams = []

    words.each do |word|
      next unless word.length == @origin_word.length
      if word.downcase.chars.sort == @origin_word.downcase.chars.sort
        anagrams << word unless word.downcase == @origin_word.downcase
      end
    end

    anagrams
  end
end
