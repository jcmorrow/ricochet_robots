class CreateWallType < ActiveRecord::Migration
  def change
    create_table :wall_types do |t|
      t.boolean :up
      t.boolean :right
      t.boolean :down
      t.boolean :left

      t.timestamps null: false

    end
  end
end
