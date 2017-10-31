class CreateRobots < ActiveRecord::Migration[4.2]
  def change
    create_table :robots do |table|
      table.string :color
      table.integer :space_id

      table.timestamps null: false
    end
  end
end
