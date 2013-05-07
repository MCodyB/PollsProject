class Response < ActiveRecord::Base
	attr_accessible :user_id, :answer_id, :reply

	belongs_to :answer
	belongs_to :user
	has_one :question, :through => :answer

	validates :user_id, :answer_id, :reply, :presence => true
	# validate :user_different_from_creator
	#
	# def user_different_from_creator
	# 	self.user_id != self.question.poll.user_id
	#   end

	def self.create_response(user_id, answer_id, reply)
		self.create!(user_id: user_id,
			 					 answer_id: answer_id,
								 reply: reply)
	end
end