class RemoveImagesFromAthletes < ActiveRecord::Migration[5.2]
  def change
    remove_column :athletes, :images, :string
  end
end
