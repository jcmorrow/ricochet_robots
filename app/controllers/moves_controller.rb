class MovesController < ApplicationController

  def create
    @board = Board.find(params[:board_id])
    @move = Move.new(move_params)
    if @move.save
      redirect_to @board
    else
      redirect_to @board, flash[:notice] = "Invalid move!"
    end
  end

  private

  def move_params
    params.require(:move).permit(:robot_id, :direction)
  end
end
