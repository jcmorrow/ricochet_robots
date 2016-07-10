require 'rails_helper'

RSpec.describe Wall, type: :model do

  it 'assigns itself a type upon creation' do
    WallType.create(right: true)
    wall = Wall.create

    expect(wall.wall_type).to be_present
  end

  it 'respects preassigned wall type choice' do
    wall_type = WallType.create(right: true)
    wall = Wall.create(wall_type: wall_type)

    expect(wall.wall_type).to eq(wall_type)
  end

end
