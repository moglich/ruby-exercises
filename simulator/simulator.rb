class Robot
  DIRECTIONS = [:north, :east, :south, :west]
  attr_accessor :bearing, :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def orient(direction)
    input_valid?(direction)
    self.bearing = direction 
  end

  def turn_right
    index = (DIRECTIONS.index(self.bearing) + 1) % 4
    self.bearing = DIRECTIONS[index]
  end

  def turn_left
    index = (DIRECTIONS.index(self.bearing) - 1) % 4
    self.bearing = DIRECTIONS[index]
  end

  def advance
    case self.bearing
    when DIRECTIONS[0] then self.y += 1 
    when DIRECTIONS[1] then self.x += 1 
    when DIRECTIONS[2] then self.y -= 1 
    when DIRECTIONS[3] then self.x -= 1 
    end
  end

  def at(cord_x, cord_y)
    self.x = cord_x
    self.y = cord_y
  end

  def coordinates
    [self.x, self.y]
  end

  private

  def input_valid?(input)
    raise ArgumentError if not DIRECTIONS.include? input
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

