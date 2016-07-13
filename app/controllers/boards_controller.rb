class BoardsController < ApplicationController
  def create
    board = Board.create
    @solution = Solution.create(original_board: board)
    redirect_to @solution
  end

  def show
    @board = Board.includes(:spaces, :walls, :wall_types, :robots, :goals).find(params[:id])
    @move = Move.new
    @moves_count = @board.moves.count
    flash[:notice] = "Solved!" if @board.goal.completed?
  end
end
