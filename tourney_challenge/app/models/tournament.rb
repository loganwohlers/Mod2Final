class Tournament < ApplicationRecord
	has_many :brackets
	has_many :users, through: :brackets
end
