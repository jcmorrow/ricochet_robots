class Space < ActiveRecord::Base
  belongs_to :board
  has_many :spaces, through: :board
  has_one :robot
  has_one :wall
  has_one :goal

  validates_presence_of :board_id

  scope :unoccupied, -> { includes(:robot).where(robots: { id: nil }) }
  scope :random, -> { order("RANDOM()") }

  def occupied?
    robot.present?
  end

  def down distance=1
    board_space(row: row + distance, column: column)
  end

  def up distance=1
    board_space(row: row - distance, column: column)
  end

  def left distance=1
    board_space(row: row, column: column - distance)
  end

  def right distance=1
    board_space(row: row, column: column + distance)
  end

  def middle_four?
    board.middle_four_spaces.include? self
  end

  def open_left?
    !closed_left?
  end

  def open_right?
    !closed_right?
  end

  def open_up?
    !closed_up?
  end

  def open_down?
    !closed_down?
  end

  def closed_left?
    furthest_left? || wall_left? || left.occupied? || left.middle_four?
  end

  def closed_right?
    furthest_right? || wall_right? || right.occupied? || right.middle_four?
  end

  def closed_up?
    furthest_up? || wall_up? || up.occupied? || up.middle_four?
  end

  def closed_down?
    furthest_down? || wall_down? || down.occupied? || down.middle_four?
  end

  def wall_left?
    wall&.left? || left.wall&.right?
  end

  def wall_right?
    wall&.right? || right.wall&.left?
  end

  def wall_up?
    wall&.up? || up.wall&.down?
  end

  def wall_down?
    wall&.down? || down.wall&.up?
  end

  private

  def board_space(row:, column:)
    spaces.find_by(row: row, column: column)
  end

  def furthest_right?
    column == (board.size - 1)
  end

  def furthest_down?
    row == (board.size - 1)
  end

  def furthest_left?
    column == (0)
  end

  def furthest_up?
    row == (0)
  end
end
