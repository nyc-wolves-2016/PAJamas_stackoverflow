class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :answers
  has_many :answerers, through: :answers, source: :answerer
  has_many :commenters, through: :comments, source: :commenter
  belongs_to :asker, class_name: "User", foreign_key: :asker_id

  validates :title, presence: true
  validates :asker_id, presence: true

  def has_best_answer?
    self.answers.any? { |answer| answer.best_status == 1}
  end

  def total_votes
    self.votes.sum(:value)
  end

  def last_answer_received
    (self.answers.last).updated_at.strftime "%Y-%m-%d"
  end

  def last_answer_giver
    (self.answers.last).answerer.username
  end

end
