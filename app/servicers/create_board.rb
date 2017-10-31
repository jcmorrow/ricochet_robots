class CreateBoard
  def self.run
    board = Board.create
    board.add_spaces
    board.add_robots
    board.add_walls
    board.add_goal
    board
  end
end
