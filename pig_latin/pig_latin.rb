class PigLatin

  def self.translate(phrase)
    phrase.split(' ').map do |word|
      pattern = /^ch|qu|squ|thr|th|sch|\A[^aeiou]/
      case word
      when /\A[aeiou]|[xy][^aeiou]/ then word = word + 'ay'
      when pattern then 
        first = word.gsub(pattern, '') 
        word = first + word.match(pattern)[0] + 'ay'
      end
      word
    end.join(' ')
  end
end


