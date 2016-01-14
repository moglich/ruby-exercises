class Translation
  def self.of_codon(codon)
    case codon
    when 'AUG' then 'Methionine'
    when 'UUU', 'UUC' then 'Phenylalanine'
    when 'UUA', 'UUG' then 'Leucine'
    when 'UCU', 'UCC', 'UCA', 'UCG' then 'Serine'
    when 'UAU', 'UAC' then 'Tyrosine'
    when 'UGU', 'UGC' then 'Cysteine'
    when 'UGG' then 'Tryptophan'
    when 'UAA', 'UAG', 'UGA' then 'STOP'
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

