class Answer < ActiveRecord::Base
	attr_accessible :body, :question_id

	has_many :responses
	has_many :users, :through => :responses
	belongs_to :question
	has_one :poll, :through => :question

	validates :body, :question_id, :presence => true

	def self.create_answer(question_id, body)
		Answer.create!(question_id: question_id, body: body)
	end

end