class Cipher

  def initialize(key = "aaaaaaaaaa")
    if key.match(/^[a-z]+$/)
      @@key = key
    else
      raise ArgumentError
    end
  end

  def key
    @@key
  end

  def encode(plaintext)
    key_shifts = @@key.bytes.map { |b| b - "a".ord }
    out = plaintext.bytes.map.with_index do |byte, idx|
      num = byte + key_shifts[idx]
      if num > "z".ord
        num -= "z".ord
        num += "a".ord - 1
      end
      num.chr
    end
    out.join
  end

  def decode(ciphertext)
    key_shifts = @@key.bytes.map { |b| b - "a".ord }
    out = ciphertext.bytes.map.with_index do |byte, idx|
      num = byte - key_shifts[idx]
      if num < "a".ord
        num = "a".ord
      end
      num.chr
    end
    out.join
  end
end
