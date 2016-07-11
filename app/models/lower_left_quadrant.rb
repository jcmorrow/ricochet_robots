class LowerLeftQuadrant < Quadrant
  private

  def origin
    [8, 0]
  end

  def vertical_wall
    spaces.where(column: 0)
  end

  def horizontal_wall
    spaces.where(row: 15)
  end

  def vertical_wall_type
    WallType.left.up.first
  end

  def horizontal_wall_type
    WallType.right.down.first
  end
end
