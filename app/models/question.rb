class Question
	attr_accessible :body, :poll_id
	has_many :answers
	belongs_to :poll
	has_many :responses, :through => :answers
	has_one :user, :through => :polls

	validates :body, :presence => true
	validates :poll_id, :presence => true
end