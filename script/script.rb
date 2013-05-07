def get_replies(question_id)
	q = Question.find(question_id).body
	ans = answers_for_question(question_id).pluck(:body)
	puts "For #{q} choose one from #{ans}"
	reply = gets.chomp
	a = Answer.where(body: reply, question_id: question_id).first
	Response.create_response(self.id, a.id, reply)
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
			Answer.create_answer(question.id, a_body)
		end
	end
end