class Robot
  DIRECTIONS = [:north, :east, :south, :west]
  attr_accessor :bearing, :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def orient(direction)
    valid_direction?(direction)
    self.bearing = direction 
  end

  def turn_right
    turn(:right)
  end

  def turn_left
    turn(:left)
  end

  def advance
    case self.bearing
    when DIRECTIONS[0] then self.y += 1 
    when DIRECTIONS[1] then self.x += 1 
    when DIRECTIONS[2] then self.y -= 1 
    when DIRECTIONS[3] then self.x -= 1 
    end
  end

  def at(x, y)
    self.x = x
    self.y = y
  end

  def coordinates
    [self.x, self.y]
  end

  private

  def valid_direction?(input)
    raise ArgumentError, 'Invalid direction!' if not DIRECTIONS.include? input
  end

  def turn(direction)
    operator = direction == :left ? :- : :+
    index = DIRECTIONS.index(self.bearing).send(operator, 1) % 4
    self.bearing = DIRECTIONS[index]
  end

end

class Simulator
  INSTRUCTIONS = { turn_left: 'L',
                   turn_right: 'R',
                   advance: 'A' }

  def instructions(instructs)
    instructs.chars.map do |i|
      INSTRUCTIONS.key(i)
    end
  end

  def place(robot, position)
    robot.at(position[:x], position[:y])
    robot.orient(position[:direction])
  end

  def evaluate(robot, instructs)
    instructions(instructs).each do |cmd|
      robot.send(cmd)
    end
  end
end

