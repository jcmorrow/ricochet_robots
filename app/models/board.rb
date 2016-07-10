class Board < ActiveRecord::Base
  BOARD_SIZE = 16
  has_many :spaces
  has_many :robots, through: :spaces
  after_create :add_spaces

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

  def goal
    Goal.includes(:space).where(spaces: {board_id: self}).first
  end

  def set_size
    update(size: BOARD_SIZE)
  end

  def add_robots
    colors.each do |color|
      space = random_unoccupied_space
      space.robot = Robot.new(color: color)
      space.save
    end
  end

  def add_walls
    20.times do
      space = random_space
      space.wall = Wall.new
      space.save
    end
  end

  def add_goal
    space = random_unoccupied_space
    space.goal = Goal.new(color: random_color)
    space.save
  end

  def middle_four_spaces
    spaces.where("spaces.row IN (7,8) AND spaces.column IN (7,8)")
  end

  def random_unoccupied_space
    return self.spaces.unoccupied.order("RANDOM()").first
  end

  def random_space
    return self.spaces.order("RANDOM()").first
  end

  def random_color
    index = Random::rand(colors.length)
    colors[index]
  end

  def colors
    %w[red green blue yellow]
  end

end
