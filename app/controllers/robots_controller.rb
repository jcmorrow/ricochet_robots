class RobotsController < ApplicationController
  def move_right
    @robot = Robot.find(params[:robot_id])
    @robot.move_right
    @board = @robot.board
    redirect_to @board
  end
end