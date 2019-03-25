class CreateBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.string :name
      t.integer :tournament_id
      t.integer :user_id

      t.timestamps
    end
  end
end
