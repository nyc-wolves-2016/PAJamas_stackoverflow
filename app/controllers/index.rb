get '/' do
  @questions = Question.all.order("created_at")
  erb :'index'
end
