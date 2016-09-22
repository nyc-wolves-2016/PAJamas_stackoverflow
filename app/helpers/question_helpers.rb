def owns_question?(question)
  binding.pry
	current_user.id == question.asker.id if logged_in?
end
