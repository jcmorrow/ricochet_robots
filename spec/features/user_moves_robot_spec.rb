require 'rails_helper'

RSpec.feature "User moves a robot" do
  scenario "by using the web form" do
    board = Board.create()
    visit board_url(board)

    fill_in :move_robot_id, with: board.robots.first.id
    fill_in :move_direction, with: "up"

    click_on("Move Robot")

    expect(board.robots.first).to be_furthest_up
  end
end