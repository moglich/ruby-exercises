class Crypto
  def initialize(input_string)
    @crypto_input = input_string
  end

  def normalize_plaintext
    @crypto_input.gsub(/\W/, '').downcase
  end

  def size
    square = Math.sqrt(normalize_plaintext.size)
    square == square.to_i ? square : square.ceil
  end

  def generate_segments
    segments = []
    crypto_size = size
    plaintext_chars = normalize_plaintext.chars
    loop do
      segments << plaintext_chars.shift(crypto_size)
      if segments.last.size != crypto_size
        shift_chars = crypto_size - segments.last.size
        shift_chars.times do
          segments.last << ''
        end
      end
      break if plaintext_chars.empty?
    end
    segments
  end

  def plaintext_segments
    generate_segments.map(&:join)
  end

  def ciphertext
    generate_segments.transpose.map(&:join).join
  end

  def normalize_ciphertext
    generate_segments.transpose.map(&:join).join ' '
  end
end
