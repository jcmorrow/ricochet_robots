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

  def middle_four space
    return "middle-four" if (space.row.between?(7,8)) && (space.column.between?(7,8))
  end
end