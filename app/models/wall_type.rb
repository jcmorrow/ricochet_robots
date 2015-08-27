class WallType < ActiveRecord::Base
  has_many :walls

  scope :random, -> { order("RANDOM()") }
end