class UpperLeftQuadrant < Quadrant
  private

  def origin
    [0, 0]
  end

  def vertical_wall
    spaces.where(column: 0)
  end

  def horizontal_wall
    spaces.where(row: 0)
  end

  def vertical_wall_type
    WallType.left.down.first
  end

  def horizontal_wall_type
    WallType.right.up.first
  end
end
