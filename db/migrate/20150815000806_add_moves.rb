class AddMoves < ActiveRecord::Migration[4.2]
  def change
    create_table :moves do |table|
      table.integer :robot_id
      table.string :direction

      table.timestamps null: false

    end
  end
end
