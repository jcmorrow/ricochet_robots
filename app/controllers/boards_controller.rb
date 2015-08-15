class BoardsController < ApplicationController
  def new
    @board = Board.create
    redirect_to @board
  end

  def show
    @board = Board.find(params[:id])
    @move = Move.new
  end
end