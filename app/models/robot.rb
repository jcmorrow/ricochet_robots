class Robot < ActiveRecord::Base
  #attrs: color, is_on_space?, is_color_of_interest?
  belongs_to :space
  has_one :board, through: :space
  after_save :check_goal


  def check_goal
    if(space.goal.present? && (space.goal.color == color))
      space.goal.satisfied = true
      space.goal.save
    end
  end

  def move_to space
    self.space = space
    self.save
  end

  def move_down
    return unless space.open_down?
    move_to(space.down)
    move_down
  end

  def move_up
    return unless space.open_up?
    move_to(space.up)
    move_up
  end

  def move_left
    return unless space.open_left?
    move_to(space.left)
    move_left
  end

  def move_right
    return unless space.open_right?
    move_to(space.right)
    move_right
  end
end