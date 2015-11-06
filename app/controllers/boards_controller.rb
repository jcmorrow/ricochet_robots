class BoardsController < ApplicationController
  def new
    @board = Board.create
    redirect_to @board
  end

  def show
    @board = Board.includes(spaces: :robot).find(params[:id])
    @move = Move.new
    flash[:notice] = "Solved!" if @board.goal.completed?
  end

  def spaces
    @board = Board.includes(spaces: :robot).find(params[:board_id])
    render json: @board.spaces.to_json(include: :robot)
  end
end