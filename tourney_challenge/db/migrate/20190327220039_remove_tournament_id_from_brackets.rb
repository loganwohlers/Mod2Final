class RemoveTournamentIdFromBrackets < ActiveRecord::Migration[5.2]
  def change
    remove_column :brackets, :tournament_id, :integer
  end
end
