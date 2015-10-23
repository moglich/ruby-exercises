class Robot
  DIRECTIONS = [:north, :east, :south, :west]
  attr_accessor :bearing, :direction, :x, :y

  def initialize
    self.x = 0
    self.y = 0
  end

  def orient(direction)
    input_valid?(direction)
    @bearing = direction 
  end

  def turn_right
    new_index = DIRECTIONS.index(@bearing) + 1
    new_index = 0 if new_index > 3
    @bearing = DIRECTIONS[new_index]
  end

  def turn_left
    new_index = DIRECTIONS.index(@bearing) - 1
    new_index = 3 if new_index < 0
    @bearing = DIRECTIONS[new_index]
  end

  def advance
    case @bearing
    when :north then @y += 1 
    when :east  then @x += 1 
    when :south then @y -= 1 
    when :west  then @x -= 1 
    end
  end

  def at(cord_x, cord_y)
    @x = cord_x
    @y = cord_y
  end

  def coordinates
    [@x, @y]
  end

  private

  def input_valid?(input)
    raise ArgumentError if not [:east, :west, :north, :south].include? input
  end
end

class Simulator
  INSTRUCTIONS = { turn_left: 'L',
                   turn_right: 'R',
                   advance: 'A' }
  def initialize
  end

  def instructions(instr)
    out = []
    out = instr.chars.map do |i|
      INSTRUCTIONS.key(i)
    end
    out
  end

  def place(robot, position)
    robot.at(position[:x], position[:y])
    robot.orient(position[:direction])
  end

  def evaluate(robot, instr)
    instructions(instr).each do |cmd|
      robot.send(cmd)
    end
  end
end

