class User < ApplicationRecord
	has_many :brackets
	has_many :teams
	has_many :tournaments, through: :brackets

	validates :username, :presence => true
	validates :username, :uniqueness => true

	#bcrypt helper method
	has_secure_password

end
