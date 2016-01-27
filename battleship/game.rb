class Board
  attr_accessor :board_layout
  ROWS    = 5 # max 9
  COLUMNS = 5 # max 9

  def initialize
    @board_layout = Array.new(ROWS, " ").map{|row| Array.new(COLUMNS, " ")}
  end

  def show
    system 'clear'

    print "    "
    COLUMNS.times {|col| print " #{col + 1}  " }
    puts
    print "   +"
    COLUMNS.times { print "---+" }
    puts

    ROWS.times do |row|
      print " #{row + 1} |"
      COLUMNS.times do |column|
        print " #{board_layout[row][column]} |"
      end
      puts
      print "   +"
      COLUMNS.times { print "---+" }
      puts
    end
    puts @display_msg
  end

  def get_empty_positions
    @board_layout.each.select {|position| @board_layout[position] == ' '}
  end

  def print_layout
    puts @board_layout.inspect
  end

  def set_field(x = 0, y = 0, mark)
    x -= 1
    y -= 1
    if ((0...ROWS).include? x) and ((0...COLUMNS).include? y)
      if @board_layout[x][y] == " "
        @board_layout[x][y] = mark
        @display_msg = "Field choosen!"
      else
        @display_msg = "Choose another field!"
      end
    else
      @display_msg = "Selection out of range!"
    end
  end

  def place_ships
    @placed_ships = Array.new(ROWS, " ").map{|row| Array.new(COLUMNS, " ")}
    @placed_ships[0][0] = "x"
  end
end

class Player
  def initialize
    @board = Board.new
  end
end

class Game
  def initialize
    @board = Board.new
  end

  def play
    loop do
      @board.show
      get_user_input
      #pseudo code
      # detect hit
      # 
    end
  end

  def get_user_input
    input = gets.chomp
    position = input.split(',')
    @board.set_field(position[0].to_i, position[1].to_i, 'X')
  end
end

