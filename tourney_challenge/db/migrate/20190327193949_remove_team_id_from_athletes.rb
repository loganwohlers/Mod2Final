class RemoveTeamIdFromAthletes < ActiveRecord::Migration[5.2]
  def change
    remove_column :athletes, :team_id, :integer
  end
end
