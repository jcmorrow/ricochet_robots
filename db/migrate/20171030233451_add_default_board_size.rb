class AddDefaultBoardSize < ActiveRecord::Migration[5.1]
  def up
    change_column :boards, :size, :integer, null: false, default: 16
  end

  def down
    change_column :boards, :size, :integer, null: true
  end
end
