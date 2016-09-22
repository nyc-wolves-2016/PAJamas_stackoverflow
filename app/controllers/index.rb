get '/' do
  @questions = Question.all.order("created_at")
  if logged_in?
    @user_questions = current_user.questions
  end
  erb :'index'
end
