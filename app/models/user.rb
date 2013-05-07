class User
	attr_accessible :team_id

	has_many :polls
	has_many :answers, :through =>

end