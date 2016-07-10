class Wall < ActiveRecord::Base
  belongs_to :wall_type
  belongs_to :space

  after_create :randomize_wall_type

  def up?
    wall_type&.up
  end

  def right?
    wall_type&.right
  end

  def down?
    wall_type&.down
  end

  def left?
    wall_type&.left
  end

  private

  def randomize_wall_type
    return if wall_type.present?
    update(wall_type: WallType.random.first)
  end

end
