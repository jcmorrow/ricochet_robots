class Space < ActiveRecord::Base
  #potential fields:
  #is_goal
  #piece (blue, green, etc.)
  #closed_up, closed_down, closed_right, closed_left
  #occupied
  belongs_to :board
  validates_presence_of :board_id
  has_one :robot

  scope :unoccupied, -> { includes(:robot).where(robots: { id: nil }) }

  def occupied?
    robot.present?
  end
end