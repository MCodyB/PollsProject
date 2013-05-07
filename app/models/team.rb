class Team < ActiveRecord::Base

	has_many :users
	has_many :polls
	
	def self.create_team
		self.create!
	end

end