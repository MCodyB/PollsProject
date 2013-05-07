class Poll < ActiveRecord::Base
	attr_accessible :user_id, :team_id

	has_many :questions
	has_many :answers, :through => :questions
	belongs_to :user
	belongs_to :team

	validates :user_id, :presence => true

	def self.create_poll(user_id, team_id=nil)
		Poll.create!(user_id: user_id, team_id: team_id)
	end
end


