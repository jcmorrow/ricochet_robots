class Board < ActiveRecord::Base
  BOARD_SIZE = 16
  COLORS = %w[red green blue yellow].freeze

  has_many :spaces
  has_many :walls, through: :spaces
  has_many :wall_types, through: :walls
  has_many :robots, through: :spaces
  has_many :moves, through: :robots
  has_many :goals, through: :spaces

  after_create :add_spaces

  def goal
    goals.first
  end

  def add_spaces
    set_size
    indexed_size = size - 1
    (0..indexed_size).each do |row|
      (0..indexed_size).each do |column|
        Space.create(board_id: self.id, row: row, column: column)
      end
    end
    add_robots
    add_walls
    add_goal
  end

  def set_size
    update(size: BOARD_SIZE)
  end

  def add_robots
    COLORS.each do |color|
      space = spaces.random.unoccupied.first
      space.update(robot: Robot.new(color: color))
    end
  end

  def add_walls
    quadrants = [
      UpperLeftQuadrant.new(
        spaces: spaces.where(row: 0..7, column: 0..7),
      ),
      UpperRightQuadrant.new(
        spaces: spaces.where(row: 0..7, column: 8..15),
      ),
      LowerRightQuadrant.new(
        spaces: spaces.where(row: 8..15, column: 8..15),
      ),
      LowerLeftQuadrant.new(
        spaces: spaces.where(row: 8..15, column: 0..7),
      ),
    ]
    quadrants.each do |quadrant|
      quadrant.add_inner_walls
      quadrant.add_side_walls
    end
  end

  def add_goal
    space = spaces.joins(:wall).order("RANDOM()").first
    space.update(goal: Goal.new(color: random_color))
  end

  def middle_four_spaces
    spaces.where("spaces.row IN (7,8) AND spaces.column IN (7,8)")
  end

  def random_space
    spaces.order("RANDOM()").first
  end

  def random_color
    index = Random::rand(COLORS.length)
    COLORS[index]
  end
end
