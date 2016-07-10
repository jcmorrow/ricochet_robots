class Space < ActiveRecord::Base
  belongs_to :board
  has_one :robot
  has_one :wall
  has_one :goal

  validates_presence_of :board_id

  scope :unoccupied, -> { includes(:robot).where(robots: { id: nil }) }

  def occupied?
    robot.present?
  end

  #movement functions (could be DRYed out?)
  def down distance=1
    Space.where(board: self.board, row: (self.row + distance), column: self.column).first
  end

  def up distance=1
    Space.where(board: self.board, row: (self.row - distance), column: self.column).first
  end

  def left distance=1
    Space.where(board: self.board, row: (self.row), column: self.column - distance).first
  end

  def right distance=1
    Space.where(board: self.board, row: (self.row), column: self.column + distance).first
  end

  def open_left?
    return false if furthest_left?
    return false if wall&.left?
    return false if left.wall&.right?
    return false if left.occupied?
    return false if board.middle_four_spaces.include? left
    return true
  end

  def open_down?
    return false if furthest_down?
    return false if wall&.down?
    return false if down.wall&.up?
    return false if down.occupied?
    return false if board.middle_four_spaces.include? down
    return true
  end

  def open_right?
    return false if furthest_right?
    return false if wall&.right?
    return false if right.wall&.left?
    return false if right.occupied?
    return false if board.middle_four_spaces.include? right
    return true
  end

  def open_up?
    return false if furthest_up?
    return false if wall&.up?
    return false if up.wall&.down?
    return false if up.occupied?
    return false if board.middle_four_spaces.include? up
    return true
  end

  #Furthest (on the edge of the board)
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
