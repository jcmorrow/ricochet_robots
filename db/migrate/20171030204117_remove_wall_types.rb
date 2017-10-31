class RemoveWallTypes < ActiveRecord::Migration[5.1]
  def change
    drop_table :wall_types do |t|
      t.boolean :up
      t.boolean :right
      t.boolean :down
      t.boolean :left

      t.timestamps null: false
    end
  end
end
