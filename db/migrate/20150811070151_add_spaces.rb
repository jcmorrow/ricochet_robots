class AddSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |table|
      table.integer :board_id

      table.timestamps null: false
    end
  end
end
