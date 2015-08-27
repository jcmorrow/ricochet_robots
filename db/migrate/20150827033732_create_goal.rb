class CreateGoal < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :space_id
      t.string :color
      t.boolean :satisfied

      t.timestamps null: false
    end
  end
end
