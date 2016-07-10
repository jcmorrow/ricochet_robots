require "rails_helper"

feature "User creates a game" do
  scenario "and sees a populated board" do
    visit root_path

    click_on I18n.t(".new_game")

    expect(page).to have_css(".board")
    expect(page).to have_css(".board .robot")
  end
end
