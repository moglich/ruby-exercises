class House
  def self.recite
    pieces = House.new.send(:pieces)
    rhyme = []

    pieces.size.times do |piece_idx|
      lines = []
      pieces.flatten
            .reverse[0..(piece_idx * 2)]
            .reverse.unshift('This is')
            .each_slice(2) do |who, what|
        lines << "#{who} #{what}\n"
      end
      lines.last.gsub!("\n", ".\n")
      rhyme << (lines << "\n")
    end

    rhyme.last.last.strip!
    rhyme.join
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
