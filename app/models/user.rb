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

	def make_poll(n) # number of Qs in poll
		poll = Poll.create_poll(self.id, self.team_id)
		n.times do
			puts "Please enter a question"
			q_body = gets.chomp
			question = Question.create_question(poll.id, q_body)

			loop do
				puts "Please enter a possible answer to the above question"
				puts "Enter q when you are finished"
				a_body = gets.chomp.capitalize!

				break if a_body == 'Q'
				Answer.create_answer(question.id, body)
			end
		end
	end
end