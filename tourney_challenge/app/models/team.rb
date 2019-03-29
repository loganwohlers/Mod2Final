class Team < ApplicationRecord
    has_many :athlete_teams
    has_many :athletes, through: :athlete_teams

    has_many :team_brackets
	has_many :brackets, through: :team_brackets

    belongs_to :user

    validates :name, :school, :history, :team_spirit, :presence => true

    validate :validate_roster
    

	def offensive_score
        total=0.0
        self.athletes.each do |a|
            total+=a.offense
        end
        ((total/self.athletes.length)*10).round(3)
    end

    def validate_roster
       if self.athletes.length!=5
           errors.add(:base, 'Must select 5 players')
       end
   end

    def defensive_score
        total=0.0
        self.athletes.each do |a|
            total+=a.defense
        end
        ((total/self.athletes.length)*10).round(3)
    end

    def power_score
       ((self.offensive_score+self.defensive_score)/2)
    end

    def roster
        self.athletes.length==5
    end
end
