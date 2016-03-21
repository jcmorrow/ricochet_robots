require 'rails_helper'

describe Robot, type: :model do
  it 'has a valid factory' do
    FactoryGirl.create(:robot)
  end
  it 'can move to the left'
  it 'can move down'
  it 'can move up'
end
