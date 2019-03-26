class AddImageToAthletes < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :image, :string
  end
end
