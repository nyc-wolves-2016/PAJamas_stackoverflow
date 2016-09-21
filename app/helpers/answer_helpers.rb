def owns_answer?(answer)
	current_user.id == answer.answerer.id if logged_in?
end