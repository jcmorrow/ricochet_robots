class Wall < ActiveRecord::Base
  enum wall_type: %w(BottomLeft BottomRight TopLeft TopRight).freeze

  belongs_to :space

  def wall_type_class
    "#{wall_type}Wall".constantize
  end

  def up?
    wall_type_class.up?
  end

  def right?
    wall_type_class.right?
  end

  def down?
    wall_type_class.down?
  end

  def left?
    wall_type_class.left?
  end

  def randomize_wall_type!
    update!(wall_type: Wall.wall_types.keys.sample)
  end
end
