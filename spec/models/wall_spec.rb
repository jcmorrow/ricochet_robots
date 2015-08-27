require 'rails_helper'

RSpec.describe Wall, type: :model do

  it 'assigns itself a type upon creation' do
    wall = Wall.create

    expect(wall.wall_type).to be_present
  end

  it 'respects preassigned wall type choice' do
    wall = Wall.create(wall_type_id: 1)

    expect(wall.wall_type_id).to be(1)
  end

end