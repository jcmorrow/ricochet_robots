require 'rails_helper'

RSpec.feature "The index is viewable" do
  scenario "with a standard GET request" do
    visit root_url
  end
end