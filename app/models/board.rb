class Board < ActiveRecord::Base
  COLORS = %w(blue green red yellow).freeze

  has_many :spaces
  has_many :walls, through: :spaces
  has_many :robots, through: :spaces
  has_many :moves, through: :robots
  has_many :goals, through: :spaces

  def goal
    goals.first
  end

  def add_spaces
    new_spaces = []
    size.times.with_index do |row|
      size.times.with_index do |column|
        new_spaces << Space.new(board: self, row: row, column: column)
      end
    end
    update(spaces: new_spaces)
  end

  def add_robots
    COLORS.each do |color|
      space = spaces.with_wall.unoccupied.random.first
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
    COLORS.sample
  end
end
