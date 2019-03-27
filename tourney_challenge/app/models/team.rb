class Team < ApplicationRecord
	has_many :athletes
    belongs_to :user
    accepts_nested_attributes_for :athletes

    validates :name, :school, :history, :team_spirit, :presence => true

	def offensive_score
        total=0.0
        self.athletes.each do |a|
            total+=a.offense
        end
        ((total/self.athletes.length)*10).round(3)
    end

    def defensive_score
        total=0.0
        self.athletes.each do |a|
            total+=a.defense
        end
        ((total/self.athletes.length)*10).round(3)
    end

    def power_score
        ((self.offensive_score+self.defensive_score)/2).round(3)
    end
end
