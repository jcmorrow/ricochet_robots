class WallType < ActiveRecord::Base
  has_many :walls

  scope :random, -> { order("RANDOM()") }
  scope :down, -> { where(down: true) }
  scope :left, -> { where(left: true) }
  scope :right, -> { where(right: true) }
  scope :up, -> { where(up: true) }
end
