module SpaceHelper
  def wall_type space
    return '' if space.wall.nil?
    wall_type = []
    wall_type << 'wall-up'if space.wall.up?
    wall_type << 'wall-down'if space.wall.down?
    wall_type << 'wall-right'if space.wall.right?
    wall_type << 'wall-left'if space.wall.left?
    return wall_type.join ' '
  end

  def goal space
    return "goal #{space.goal.color}" if space.goal.present?
  end
end