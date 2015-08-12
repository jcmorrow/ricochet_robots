class RobotsController < ApplicationController
  def move_right
    @robot = Robots.find(params[:id])
    @robot.move_right
    @board = @robot.board
    render 'boards/show'
  end
end