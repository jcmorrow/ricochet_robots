class Goal < ActiveRecord::Base
  belongs_to :space
  has_one :board, through: :space

  def completed?
    satisfied
  end

end