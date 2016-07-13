class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
      t.references :board
      t.references :original_board

      t.timestamps null: false
    end
  end
end
