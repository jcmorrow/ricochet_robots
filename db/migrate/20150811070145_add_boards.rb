class AddBoards < ActiveRecord::Migration[4.2]
  def change
    create_table :boards do |table|
      table.timestamps null: false
    end
  end
end
