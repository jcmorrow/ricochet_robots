class Move < ActiveRecord::Base
  validates_presence_of :robot_id, :direction
  validates :direction, inclusion: { in: %w(up right down left) }
  belongs_to :robot

  after_create :execute

  def execute
    direction_function = "move_#{direction}".to_sym
    robot.send(direction_function)
  end

end