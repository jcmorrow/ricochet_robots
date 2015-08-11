class Board < ActiveRecord::Base
  has_many :spaces
  after_create :add_spaces

  def add_spaces
    (0..7).each do |row|
      (0..7).each do |column|
        Space.create(board_id: self.id)
      end
    end
  end

end