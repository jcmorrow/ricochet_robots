class Robot < ActiveRecord::Base
  belongs_to :space
  has_one :board, through: :space


  def check_goal
    if(space.goal.present? && (space.goal.color == color))
      space.goal.satisfied = true
      space.goal.save
    end
  end

  def move_to space
    self.update(space: space)
  end

  def move_down
    if space.open_down?
      move_to(space.down)
      move_down
    else
      check_goal
    end
  end

  def move_up
    if space.open_up?
      move_to(space.up)
      move_up
    else
      check_goal
    end
  end

  def move_left
    if space.open_left?
      move_to(space.left)
      move_left
    else
      check_goal
    end
  end

  def move_right
    if space.open_right?
      move_to(space.right)
      move_right
    else
      check_goal
    end
  end
end
