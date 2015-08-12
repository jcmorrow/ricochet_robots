class BoardsController < ApplicationController
  def new
    @board = Board.create
    render 'show'
  end
end