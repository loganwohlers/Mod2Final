class CreateAthleteTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :athlete_teams do |t|
      t.integer :athlete_id
      t.integer :team_id

      t.timestamps
    end
  end
end
