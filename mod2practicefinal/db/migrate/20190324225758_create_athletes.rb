class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :age
      t.string :bio
      t.string :school
      t.integer :team_id

      t.timestamps
    end
  end
end
