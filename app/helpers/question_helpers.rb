def owns_question?(question)
	current_user.id == question.asker.id if logged_in?
end
