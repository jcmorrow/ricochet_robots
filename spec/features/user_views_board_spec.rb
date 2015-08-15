require 'rails_helper'

RSpec.feature "User views a board" do
  scenario "by creating a new board" do
    visit new_board_url

    expect(page).to have_css('.board .space .robot')
  end
end