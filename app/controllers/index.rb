get '/' do
  @questions = Question.all.order("created_at")
  if logged_in?
    @user = current_user
  end
  erb :'index'
end
