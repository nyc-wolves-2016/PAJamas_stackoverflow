class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable
  belongs_to :commenter, class_name: "User"

  validates :body, presence: true
  # validates :commenter_id, presence: true
  # validates :commentable_id, presence: true
  # validates :commentable_type, presence: true

end
