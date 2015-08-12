require 'rails_helper'

describe Robot, type: :model do
  it 'can move' do
    board = Board.create()

    board.robots.first.move_right

    expect(board.robots.first.space.column).to eq(board.size - 1)
  end
end