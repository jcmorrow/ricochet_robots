class Robot < ActiveRecord::Base
  #attrs: color, is_on_space?, is_color_of_interest?
  belongs_to :space
  has_one :board, through: :space

  def move_right
    return if(!furthest_right?)
    self.space = board.spaces.where(column: (self.space.column + 1), row: self.space.row).first
    move_right
  end

  def furthest_right?
    self.space.column < (board.size - 1)
  end
end