class AddBoards < ActiveRecord::Migration
  def change
    create_table :boards do |table|
      table.timestamps null: false
    end
  end
end
