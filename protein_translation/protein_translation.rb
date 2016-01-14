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
    protein = []
    (strand.size / 3).times do |i|
      protein_test = strand[i*3..(i*3+2)]
      test_var = Translation.of_codon(protein_test)
      if test_var == 'STOP'
        return protein
      else
        protein << test_var
      end
    end
    protein
  end
end

