class AddSpaces < ActiveRecord::Migration[4.2]
  def change
    create_table :spaces do |table|
      table.integer :board_id

      table.timestamps null: false
    end
  end
end
