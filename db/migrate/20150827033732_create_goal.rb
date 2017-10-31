class CreateGoal < ActiveRecord::Migration[4.2]
  def change
    create_table :goals do |t|
      t.integer :space_id
      t.string :color
      t.boolean :satisfied

      t.timestamps null: false
    end
  end
end
