class PigLatin

  def self.translate(phrase)
    phrase.split(' ').map do |word|
      vowel_sound = /\A[aeiou]|[xy][^aeiou]/ 
      consonant_sound = /^ch|qu|squ|thr|th|sch|\A[^aeiou]/
      case word
      when vowel_sound then word += 'ay'
      when consonant_sound then 
        word_without_consonant = word.gsub(consonant_sound, '') 
        word = word_without_consonant + word.match(consonant_sound)[0] + 'ay'
      end
      word
    end.join(' ')
  end
end


