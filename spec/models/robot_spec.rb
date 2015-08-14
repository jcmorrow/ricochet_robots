require 'rails_helper'

describe Robot, type: :model do
  it 'can move down and to the right' do
    board = Board.create()

    board.robots.first.move_right
    board.robots.first.move_down

    expect(board.robots.first.space.column).to eq(board.size - 1)
    expect(board.robots.first.space.row).to eq(board.size - 1)
  end

  it 'can move up and to the left' do
    board = Board.create()

    board.robots.first.move_up
    board.robots.first.move_left

    expect(board.robots.first.space.column).to eq(0)
    expect(board.robots.first.space.row).to eq(0)
  end
end