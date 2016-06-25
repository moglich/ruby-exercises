class Robot
  @robot_names = []

  def reset
    @name = nil
  end

  def name
    @name ||= generate_name
  end

  def self.robot_names
    @robot_names
  end

  private

  def generate_name
    name = ('AA'..'ZZ').to_a.sample
    name << ('000'..'999').to_a.sample

    if Robot.robot_names.include? name
      name = generate_name
    else
      Robot.robot_names << name
    end
    name
  end
end
