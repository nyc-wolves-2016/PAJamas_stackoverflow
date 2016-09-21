post "/questions/:question_id/answers" do
	@question = Question.find_by(id: params[:id])
	@answer = Answer.new(params[answer])
	if @answer.save
		@question.answers << @answer
		current_user.answers << @answer
		current_user.users_helped << @question.asker
end