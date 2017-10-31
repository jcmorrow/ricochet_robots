class Quadrant
  def initialize(spaces:)
    @spaces = spaces
  end

  def add_side_walls
    horizontal_wall.random.first.update(
      wall: Wall.create(wall_type: horizontal_wall_type),
    )
    vertical_wall.random.first.update(
      wall: Wall.create(wall_type: vertical_wall_type),
    )
  end

  def add_inner_walls
    inner_wall_offsets.each do |wall_offset|
      row = origin[0] + wall_offset[0]
      column = origin[1] + wall_offset[1]
      wall = Wall.create
      wall.randomize_wall_type!
      space_at(row: row, column: column).update(wall: wall)
    end
  end

  private

  attr_reader :spaces

  def inner_wall_offsets
    (1..6).to_a.shuffle.zip((1..6).to_a.shuffle).first(4)
  end

  def space_at(row:, column:)
    spaces.find_by(row: row, column: column)
  end
end
