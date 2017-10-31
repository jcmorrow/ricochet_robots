class RobotsRequireAColor < ActiveRecord::Migration[5.1]
  def up
    change_column :robots, :color, :string, null: false
  end

  def down
    change_column :robots, :color, :string, null: true
  end
end
