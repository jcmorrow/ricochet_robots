require 'rails_helper'

describe Move, type: :model do

  it 'can be performed' do
    expect(subject).to respond_to(:perform)
  end
  
end