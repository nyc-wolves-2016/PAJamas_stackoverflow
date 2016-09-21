post "/questions/:question_id/answers" do
	@question = Question.find_by(id: params[:question_id])
	@answer = Answer.new(params[:answer])
	# for testing
	@user = User.first
	current_user = @user
	if @answer.save
		@question.answers << @answer
		if request.xhr?
			erb :'answers/_show', locals: {answer: answer}
		else
		redirect "/questions/#{@question.id}"
	end
	else
		@errors = @answer.errors.full_message
		erb :'questions/show'
	end
end

# this is for testing
get "/questions/:question_id" do
	@user = User.first
	@question = Question.find_by(id: params[:question_id])
	erb :'questions/show'
end