class RemovePowerscoreFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :power_score, :float
  end
end
