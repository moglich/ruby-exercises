class Cipher

  def initialize(key = "a")
    @@key = key
  end

  def key
    @@key
  end

  def encode(plaintext)
    @@key
  end

  def decode(encoded_text)
    @@key*10
  end

end
