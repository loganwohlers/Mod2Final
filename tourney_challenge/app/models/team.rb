class Team < ApplicationRecord
    has_many :athlete_teams
    has_many :athletes, through: :athlete_teams
    
    has_many :team_brackets
	has_many :brackets, through: :team_brackets

    belongs_to :user

    validates :name, :school, :history, :team_spirit, :presence => true

	def offensive_score
        total=0.0
        self.athletes.each do |a|
            total+=a.offense
        end
        ((total/self.athletes.length)*10).round(3)*rand(0.87...1.04)
    end

    def defensive_score
        total=0.0
        self.athletes.each do |a|
            total+=a.defense
        end
        ((total/self.athletes.length)*10).round(3)*rand(0.93...1.15)
    end

    def self.power_score

        if @powerscore==0
            ((self.offensive_score+self.defensive_score)/2)*rand(1-self.team_spirit/100...1+self.team_spirit/100)
        else
            @powerscore
        end
    end

    # validate :power_limit

    def power_limit
		# team_total = 0
		# self.team.athletes.each do |ath|
		# 	team_total += (ath.offense + ath.defense)
		# end
		team_total += (self.team_spirit + self.power_score)

    	if team_total > 200
            errors.add(:base, "Skill Points can\'t exceed 50.  Current team total is #{team_total} and you've exceeded your alloted skill points.")
     end
  end
end
