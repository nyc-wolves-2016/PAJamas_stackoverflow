get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions' do
  question = Question.new(params[:question])
  if question.save
    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

delete '/questions/:id' do
  question = Question.find(params[:id])
  question.destroy
  if !request.xhr?
    redirect '/questions'
  end
end

post "/questions/:question_id/answers" do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.new(params[:answer])
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
