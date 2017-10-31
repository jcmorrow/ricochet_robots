class MakeWallTypeAnEnum < ActiveRecord::Migration[5.1]
  def change
    remove_column :walls, :wall_type_id, :integer
    add_column :walls, :wall_type, :integer, null: false, default: 0
  end
end
