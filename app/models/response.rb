class Response < ActiveRecord::Base
	attr_accessible :user_id, :answer_id, :reply

	belongs_to :answer
	belongs_to :user
	has_one :question, :through => :answer

	validates :user_id, :answer_id, :reply, :presence => true
	validate :user_different_from_creator
	validate :reply_in_answers

	def self.create_response(user_id, answer_id, reply)
		self.create!(user_id: user_id,
			 					 answer_id: answer_id,
								 reply: reply)
	end

	def user_different_from_creator
		if self.user.id == self.question.poll.user_id
			errors[:user_id] << "Stop trying to pad your polling numbers."
		end
	end

	def reply_in_answers
		unless self.answer.pluck(:body).include?(reply)
			errors[:answer_id] << "Pick a valid answer"
	end


end