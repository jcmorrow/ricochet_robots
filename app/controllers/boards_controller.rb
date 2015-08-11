class BoardsController < ApplicationController
  def new
    @board = Board.create
  end
end