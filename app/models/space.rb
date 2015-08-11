class Space < ActiveRecord::Base
  belongs_to :board
  validates_presence_of :board_id
end