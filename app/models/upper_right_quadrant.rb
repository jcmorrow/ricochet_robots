class UpperRightQuadrant < Quadrant
  private

  def origin
    [0, 8]
  end

  def vertical_wall
    spaces.where(column: 15)
  end

  def horizontal_wall
    spaces.where(row: 0)
  end

  def vertical_wall_type
    WallType.right.down.first
  end

  def horizontal_wall_type
    WallType.left.up.first
  end
end
