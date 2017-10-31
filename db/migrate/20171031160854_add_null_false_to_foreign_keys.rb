class AddNullFalseToForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_column :solutions, :board_id, :integer
    add_reference :solutions, :board, foreign_key: true
    remove_column :solutions, :original_board_id, :integer
    add_reference :solutions, :original_board, foreign_key: { to_table: :boards }

    remove_column :spaces, :board_id, :integer
    add_reference :spaces, :board, foreign_key: true

    remove_column :robots, :space_id, :integer
    add_reference :robots, :space, foreign_key: true

    remove_column :walls, :space_id, :integer
    add_reference :walls, :space, foreign_key: true
  end
end
