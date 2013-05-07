class User
	attr_accessible :team_id

	has_many :polls
	has_many :responses
	has_many :answers, :through => :responses
	has_many :questions, :through => :polls
	belongs_to :team

	def make_poll
		poll = Poll.create_poll(self.id, self.team_id)
		#Gets body from user
		question = Question.create_question(poll.id, body)
		#Gets body from user
		Answer.create_answer(question.id, body)
	end

end