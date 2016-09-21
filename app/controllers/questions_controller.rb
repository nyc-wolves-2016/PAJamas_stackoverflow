post "/questions/:question_id/answers" do
	@question = Question.find_by(id: params[:id])
	@answer = Answer.new(params[answer])
	if @answer.save
		@question.answers << @answer
		current_user.answers << @answer
		current_user.users_helped << @question.asker
		redirect "/questions/#{@question.id}"
	else
		@errors = @answer.errors.full_message
		erb :'questions/show'
	end
end

# this is for testing
get "/questions/:question_id" do
	@question = Question.find_by(id: params[:question_id])
	erb :'questions/show'
end