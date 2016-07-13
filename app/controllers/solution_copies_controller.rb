class SolutionCopiesController < ApplicationController
  def create
    solution_to_copy = Solution.find(params[:solution_id])
    @solution = Solution.create(original_board: CopyBoard.run(board: solution_to_copy.original_board))
    redirect_to @solution
  end
end
