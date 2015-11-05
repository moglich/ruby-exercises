class Queens
  attr_reader :white, :black
  ROW = 0
  COL = 1

  def initialize(queens={white: [0, 3], black: [7, 3]})
    raise ArgumentError if invalid_input?(queens)

    @white = queens[:white]
    @black = queens[:black] 
  end

  def to_s
    board = ""
    8.times do |row|
      8.times do |col|
        if @white == [row, col]
          board.concat "W "
        elsif @black == [row, col]
          board.concat "B "
        else
          board.concat(col == 7 ? "_" : "_ ")
        end
      end
      board.concat "\n" unless row == 7
    end
    board
  end

  def attack?
    if @white[ROW] == @black[ROW]
      true
    elsif @white[COL] == @black[COL]
      true
    elsif ((@white[ROW] - @black[ROW]).abs == (@white[COL] - @black[COL]).abs)
      true
    else
      false
    end
  end

  private
  def invalid_input?(queens)
    queens[:white] == queens[:black]
  end

end
