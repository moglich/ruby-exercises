require 'pry'
class Anagram
  def initialize(origin_word)
    @origin_word = origin_word
  end

  def match(words)
    words.select { |word| anagram? @origin_word, word }
  end

  private

  def anagram?(original_word, possible_anagram)
    return false if original_word.downcase == possible_anagram.downcase
    return false if original_word.length != possible_anagram.length

    match_word = possible_anagram.downcase.chars

    original_word.downcase.chars.each do |letter|
      index = match_word.index(letter)
      match_word.delete_at(index) if index
    end
    match_word.empty?
  end
end
