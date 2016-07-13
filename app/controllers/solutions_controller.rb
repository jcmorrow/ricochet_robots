class SolutionsController < ApplicationController
  def show
    @solution = Solution.includes(
      :board,
      :spaces,
      :walls,
      :wall_types,
      :robots,
      :goals,
    ).find(params[:id])
    @move = Move.new
    flash.now[:notice] = "Solved!" if @solution.board.goal.completed?
  end
end
