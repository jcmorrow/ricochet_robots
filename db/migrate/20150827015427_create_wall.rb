class CreateWall < ActiveRecord::Migration[4.2]
  def change
    create_table :walls do |t|
      t.integer :space_id
      t.integer :wall_type_id

      t.timestamps null: false
    end
  end
end
