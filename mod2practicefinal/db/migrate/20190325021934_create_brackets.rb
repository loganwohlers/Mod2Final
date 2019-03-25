class CreateBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
