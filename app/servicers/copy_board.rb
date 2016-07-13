class CopyBoard
  def self.run(*args)
    new(*args).run
  end

  def initialize(board:)
    @board = board
  end

  def run
    copy = Board.new
    spaces = spaces_to_copy.map do |space|
      space_attrs = space.attributes.except("id").merge(
        goal: goal(space),
        wall: wall(space),
        robot: robot(space),
      )
      Space.new(space_attrs)
    end
    copy.spaces = spaces
    copy
  end

  def spaces_to_copy
    @board.spaces.includes(:wall, :robot, :goal)
  end

  def robot(space)
    if space.robot.present?
      Robot.new(space.robot.attributes.except("id"))
    end
  end

  def wall(space)
    if space.wall.present?
      Wall.new(space.wall.attributes.except("id"))
    end
  end

  def goal(space)
    if space.goal.present?
      Goal.new(space.goal.attributes.except("id"))
    end
  end
end
