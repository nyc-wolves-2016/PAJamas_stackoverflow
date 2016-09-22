def pathify(commentable)
  commentable.class.to_s.downcase + 's'
end

def owns_comment?(comment)
  current_user.id == comment.commenter.id if logged_in?
end
