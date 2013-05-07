class Response < ActiveRecord::Base
	attr_accessible :user_id, :answer_id, :reply

	belongs_to :answer
	belongs_to :user
	has_one :question, :through => :answer

	validates :user_id, :answer_id, :reply, :presence => true
	validate :user_different_from_creator
	validate :reply_in_answers
	validate :question_answered_by_user

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
		unless self.question.answers.pluck(:body).include?(reply)
			errors[:answer_id] << "Pick a valid answer"
		end
	end

	def question_answered_by_user
		if already_answered_join?
			errors[:reply] << "Question already answered"
		end
	end

	def already_answered?
		self.question.answers.each do |answer|
			answer.users.each do |user|
				return true if user.id == self.user.id
			end
		end
		false
	end

	def already_answered_join?
 			self.question.responses.pluck(:'responses.user_id').include?(self.user.id)
	end

end