class BoardsController < ApplicationController
  def new
    @board = Board.create
    redirect_to @board
  end

  def show
    @board = Board.find(params[:id])
    @move = Move.new
    @moves_count = @board.moves.count
    flash[:notice] = "Solved!" if @board.goal.completed?
  end
end
