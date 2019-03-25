class AddPointsToAthlete < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :points, :integer
    add_column :athletes, :defense, :integer
  end
end
