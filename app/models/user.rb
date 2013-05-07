class User < ActiveRecord::Base
	attr_accessible :team_id

	has_many :polls
	has_many :responses
	has_many :answers, :through => :responses
	has_many :questions, :through => :polls
	belongs_to :team

	def self.create_user(team_id=nil)
		User.create!(team_id: team_id)
	end

	#puts "For #{q} choose one from #{a}"
	def create_response(reply, answer)
		Response.create_response(self.id, a.id, reply)
	end
end