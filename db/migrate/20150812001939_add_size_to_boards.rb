class AddSizeToBoards < ActiveRecord::Migration[4.2]
  def change
    add_column :boards, :size, :integer
  end
end
