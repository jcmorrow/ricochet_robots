require 'rails_helper'

RSpec.feature "User moves a robot" do
  context "without selecting a valid robot or direction" do
    scenario "and sees an error" do
      board = Board.create()
      solution = create(:solution, original_board: board)
      visit solution_url(solution)

      click_on("Move Robot")

      expect(page).to have_content("Invalid move")
    end
  end
  scenario "by using the web form" do
    board = Board.create()
    solution = create(:solution, original_board: board)
    visit solution_url(solution)
    robot = board.robots.first

    fill_in(:move_robot_id, with: robot.id)
    fill_in(:move_direction, with: "up")

    click_on("Move Robot")

    robot.reload
    expect(robot.space).not_to be_open_up
  end
end
