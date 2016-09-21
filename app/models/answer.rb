class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :commenters, through: :comments, source: :commenter
  has_many :votes, as: :voteable
  belongs_to :answerer, class_name: "User"
  belongs_to :question

  validates :body, presence: true
  validates :answerer_id, presence: true
  validates :question_id, presence: true
  validates :best_status, numericality: { only_integer: true }
end
