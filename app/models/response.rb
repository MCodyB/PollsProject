class Response
	attr_accessible :user_id, :answer_id, :reply
	
	belongs_to :answer
	belongs_to :user
	has_one :question, :through => :answer

	validates :user_id, :answer_id, :reply, :presence => true
end