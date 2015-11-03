require 'rails_helper'

describe Robot, type: :model do
  it 'can move to the right' do
    FactoryGirl.create(:robot)
  end
  it 'can move to the left'
  it 'can move down'
  it 'can move up'
end