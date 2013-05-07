class Poll
	attr_accessible :user_id, :team_id

	has_many :questions
	belongs_to :user

	validates :user, :presence => true
	validates :questions, :presence => true
	validates :questions, :uniqueness => true
end