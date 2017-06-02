class MovesController < ApplicationController
  def create
    @solution = Solution.find(params[:solution_id])
    @move = Move.new(move_params)
    if @move.save
      redirect_to @solution
    else
      flash[:notice] = "Invalid move!"
      redirect_to @solution
    end
  end

  private

  def move_params
    params.require(:move).permit(:robot_id, :direction)
  end
end
