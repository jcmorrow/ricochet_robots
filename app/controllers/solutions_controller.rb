class SolutionsController < ApplicationController
  def show
    @solution = Solution.includes(
      :board,
      :goals,
      :robots,
      :spaces,
      :walls,
    ).find(params[:id])
    @move = Move.new
    if @solution.board.goal.completed?
      flash.now[:notice] = "Solved!"
    end
  end
end
