class AddRowsAndColumnsToSpaces < ActiveRecord::Migration[4.2]
  def change
    add_column :spaces, :row, :integer
    add_column :spaces, :column, :integer
  end
end
