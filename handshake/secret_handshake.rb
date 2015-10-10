class SecretHandshake

  def initialize(handshake)
    @REVERSE = 0b10000 

    if handshake.class == Fixnum
      @handshake_code = handshake
    else
      @handshake_code = 0
    end

    @CODES = { 0b1 => 'wink',
               0b10 => 'double blink',
               0b100 => 'close your eyes',
               0b1000 => 'jump'}
  end

  def commands
    output = @CODES.select {|key| key & @handshake_code != 0}.values
    return  (@handshake_code & @REVERSE != 0) ? output.reverse : output 
#    if @handshake_code & @REVERSE != 0
#      output.reverse
#    else
#      output
#    end
  end

end
