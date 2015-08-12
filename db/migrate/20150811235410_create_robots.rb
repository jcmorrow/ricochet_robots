class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |table|
      table.string :color
      table.integer :space_id

      table.timestamps null: false
    end
  end
end
