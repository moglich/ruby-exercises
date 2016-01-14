class Translation
  def self.of_codon(codon)
    case codon
    when 'AUG'
      'Methionine'
    when 'UUU', 'UUC'
      'Phenylalanine'
    when 'UUA', 'UUG'
      'Leucine'
    when 'UCU', 'UCC', 'UCA', 'UCG'
      'Serine'
    when 'UAU', 'UAC'
      'Tyrosine'
    when 'UGU', 'UGC'
      'Cysteine'
    when 'UGG'
      'Tryptophan'
    when 'UAA', 'UAG', 'UGA'
      'STOP'
    else raise ArgumentError
    end 
  end

  def self.of_rna(strand)
    protein_chain = []
    (strand.size / 3).times do |i|
      codon = strand[(i * 3)..((i * 3) + 2)]
      protein = Translation.of_codon(codon)
      if protein == 'STOP'
        return protein_chain
      else
        protein_chain << protein
      end
    end
    protein_chain
  end
end

