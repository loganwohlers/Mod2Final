class AddtoBracket < ActiveRecord::Migration[5.2]
  def change
    add_column :brackets, :entrants, :integer
  end
end
