require 'rails_helper'

describe Board, type: :model do
  it 'can produce a random space' do
    board = Board.create()

    expect(board.random_unoccupied_space).to be_a(Space)
  end
end