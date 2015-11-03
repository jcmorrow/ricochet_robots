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

  #checking for walls/edges.
  #open_#{direction}?
  # return false if furthest_#{direction}
  # self.open_#{direction} && #{direction}.open_#{opposite(direction)}
  def open_right?
    return false if furthest_right?
    return false if (wall.present? && wall.right?)
    return false if (right.wall.present? && right.wall.left?)
    return false if right.occupied?
    return false if board.middle_four_spaces.any? {|space| space == right}
    return true
  end

  def open_left?
    return false if furthest_left?
    return false if (wall.present? && wall.left?)
    return false if (left.wall.present? && left.wall.right?)
    return false if left.occupied?
    return false if board.middle_four_spaces.any? {|space| space == left}
    return true
  end

  def open_up?
    return false if furthest_up?
    return false if (wall.present? && wall.up?)
    return false if (up.wall.present? && up.wall.down?)
    return false if up.occupied?
    return false if board.middle_four_spaces.any? {|space| space == up}
    return true
  end

  def open_down?
    return false if furthest_down?
    return false if (wall.present? && wall.down?)
    return false if (down.wall.present? && down.wall.up?)
    return false if down.occupied?
    return false if board.middle_four_spaces.any? {|space| space == down}
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