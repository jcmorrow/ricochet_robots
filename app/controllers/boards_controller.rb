class BoardsController < ApplicationController
  def create
    board = CreateBoard.run
    @solution = Solution.create(original_board: board)
    redirect_to @solution
  end

  def show
    @board = Board.includes(:spaces, :walls, :robots, :goals).find(params[:id])
    @move = Move.new
    @moves_count = @board.moves.count
    flash[:notice] = "Solved!" if @board.goal.completed?
  end
end
