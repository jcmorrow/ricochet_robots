require "rails_helper"

describe Robot, type: :model do
  it "has a valid factory" do
    create(:robot)
  end

  it "can move up" do
    board = create_completely_empty_board
    bottom_left = board.spaces.where(column: 0, row: 1).first
    top_left = board.spaces.where(column: 0, row: 0).first
    robot = create(:robot, space: bottom_left)

    robot.move_up

    expect(robot.space).to eq(top_left)
  end

  def create_completely_empty_board
    create(:board, size: 2).tap { |board| board.add_spaces }
  end
end
