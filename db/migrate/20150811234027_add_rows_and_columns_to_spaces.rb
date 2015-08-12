class AddRowsAndColumnsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :row, :integer
    add_column :spaces, :column, :integer
  end
end
