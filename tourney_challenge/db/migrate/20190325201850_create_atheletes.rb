class CreateAtheletes < ActiveRecord::Migration[5.2]
  def change
    create_table :atheletes do |t|
      t.string :name
      t.integer :age
      t.string :bio
      t.string :school
      t.float :offense
      t.float :defense
      t.integer :team_id

      t.timestamps
    end
  end
end
