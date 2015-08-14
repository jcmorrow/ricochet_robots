class RobotsController < ApplicationController
  def move_right
    @robot = Robot.find(params[:robot_id])
    @robot.move_right
    @board = @robot.board
    redirect_to @board
  end
  def move_down
    @robot = Robot.find(params[:robot_id])
    @robot.move_down
    @board = @robot.board
    redirect_to @board
  end
  def move_up
    @robot = Robot.find(params[:robot_id])
    @robot.move_up
    @board = @robot.board
    redirect_to @board
  end
  def move_left
    @robot = Robot.find(params[:robot_id])
    @robot.move_left
    @board = @robot.board
    redirect_to @board
  end
end