class Solution < ActiveRecord::Base
  belongs_to :original_board, class_name: "Board"
  belongs_to :board
  has_many :spaces, through: :board
  has_many :goals, through: :spaces
  has_many :walls, through: :spaces
  has_many :robots, through: :spaces
  has_many :moves, through: :robots

  after_create :dup_original_board

  def dup_original_board
    self.update(board: CopyBoard.run(board: original_board))
  end
end
