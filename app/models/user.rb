class User < ActiveRecord::Base
  has_many :comments, foreign_key: :commenter_id
  has_many :answers, foreign_key: :answerer_id
  has_many :questions, foreign_key: :asker_id
  has_many :votes, foreign_key: :voter_id

  has_many :questions_answered, through: :answers, source: :question
  has_many :answers_received, through: :questions, source: :answers

  has_many :users_helped, through: :questions_answered, source: :asker
  has_many :helpers, through: :answers_received, source: :answerer

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

end
