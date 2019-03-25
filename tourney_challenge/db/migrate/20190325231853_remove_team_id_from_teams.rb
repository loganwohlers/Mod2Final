class RemoveTeamIdFromTeams < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teams, :sport_id, :integer
  end
end
