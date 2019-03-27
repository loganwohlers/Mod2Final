class CreateSkillPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :skill_points do |t|
      t.integer :athlete_id
      t.index ["athlete_id"], name: "index_skill_points_on_athlete_id"

      t.timestamps
    end
  end
end
