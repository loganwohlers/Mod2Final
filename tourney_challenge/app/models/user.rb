class User < ApplicationRecord
	has_many :brackets
	has_many :tournaments, through: :brackets
end
