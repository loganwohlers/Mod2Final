class Athlete < ApplicationRecord
	has_many :athlete_teams
	has_many :teams, through: :athlete_teams
	validates :offense, :defense, :name, :presence => true
	validates :offense, :defense, :inclusion => 1..10

	

end
