class Robot < ActiveRecord::Base
  #attrs: color, is_on_space?, is_color_of_interest?
  belongs_to :space
  has_one :board, through: :space

  def move_right
    return if(furthest_right?)
    self.space = board.spaces.where(column: (self.space.column + 1), row: self.space.row).first
    self.save
    move_right
  end

  def move_down
    return if(furthest_down?)
    self.space = board.spaces.where(column: (self.space.column), row: self.space.row + 1).first
    self.save
    move_down
  end

  def move_up
    return if(furthest_up?)
    self.space = board.spaces.where(column: (self.space.column), row: self.space.row - 1).first
    self.save
    move_up
  end

  def move_left
    return if(furthest_left?)
    self.space = board.spaces.where(column: (self.space.column - 1), row: self.space.row).first
    self.save
    move_left
  end

  def furthest_right?
    self.space.column == (board.size - 1)
  end

  def furthest_down?
    self.space.row == (board.size - 1)
  end

  def furthest_left?
    self.space.column == (0)
  end

  def furthest_up?
    self.space.row == (0)
  end
end