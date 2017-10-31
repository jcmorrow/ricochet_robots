class SpacesRequireARowAndColumn < ActiveRecord::Migration[5.1]
  def up
    change_column :spaces, :column, :integer, null: false
    change_column :spaces, :row, :integer, null: false
  end

  def down
    change_column :spaces, :column, :integer, null: true
    change_column :spaces, :row, :integer, null: true
  end
end
