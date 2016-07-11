class LowerRightQuadrant < Quadrant
  private

  def origin
    [8, 8]
  end

  def vertical_wall
    spaces.where(column: 15)
  end

  def horizontal_wall
    spaces.where(row: 15)
  end

  def vertical_wall_type
    WallType.right.up.first
  end

  def horizontal_wall_type
    WallType.left.down.first
  end
end
