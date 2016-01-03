class Board
  attr_accessor :grid

  def initialize
    @grid = {}
    (1..25).each { |pos| @grid[pos] = ' ' }
  end

  def show
    system 'clear'
    puts "----  Battleship Game  ----"
    puts
    puts "    1   2   3   4   5"
    puts "  +---+---+---+---+---+"
    puts "1 | #{@grid[1]} | #{@grid[2]} | #{@grid[3]} | #{@grid[4]} | #{@grid[5]} |"
    puts "  +---+---+---+---+---+"
    puts "2 | #{@grid[6]} | #{@grid[7]} | #{@grid[8]} | #{@grid[9]} | #{@grid[10]} |"
    puts "  +---+---+---+---+---+"
    puts "3 | #{@grid[11]} | #{@grid[12]} | #{@grid[13]} | #{@grid[14]} | #{@grid[15]} |"
    puts "  +---+---+---+---+---+"
    puts "4 | #{@grid[16]} | #{@grid[17]} | #{@grid[18]} | #{@grid[19]} | #{@grid[20]} |"
    puts "  +---+---+---+---+---+"
    puts "5 | #{@grid[21]} | #{@grid[22]} | #{@grid[23]} | #{@grid[24]} | #{@grid[25]} |"
    puts "  +---+---+---+---+---+"
    puts ""
  end

  def get_empty_positions
    @grid.keys.select {|position| @grid[position] == ' '}
  end
end

loop do
  board = Board.new
  board.grid[board.get_empty_positions.sample] = "X"
  board.show
  sleep 1
end
