class Board < ActiveRecord::Base
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
  end

  def set_size
    self.size ||= 8
    self.save
  end

  def add_robots
    colors = [:red, :green, :blue]
    colors.each do |color|
      space = random_unoccupied_space
      space.robot = Robot.new
      space.save
    end

  end

  def random_unoccupied_space
    return self.spaces.unoccupied.order("RANDOM()").first
  end

end