class Athlete < ApplicationRecord
	belongs_to :team
	has_many :skill_points
	validates :offense, :defense, :name, :presence => true
	validates :offense, :defense, :inclusion => 1..10

	validate :sum_equals_20

  def sum_equals_20
		team_total = 0
		self.team.athletes.each do |ath|
			team_total += (ath.offense + ath.defense)
		end
		team_total += self.team.team_spirit

    	if team_total > 50
       errors.add(:base, "Skill Points can\'t exceed 50.  Current team total is #{team_total} and you've exceeded your alloted skill points.")
     end
  end

end
