class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :school
      t.float :team_spirit
      t.string :history
      t.integer :sport_id

      t.timestamps
    end
  end
end
