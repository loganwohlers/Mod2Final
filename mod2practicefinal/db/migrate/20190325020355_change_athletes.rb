class ChangeAthletes < ActiveRecord::Migration[5.2]
  def change
    remove_column :athletes, :points, :integer
    add_column :athletes, :offense, :integer
  end
end
