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
  require_login
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

delete '/questions/:id' do
  question = Question.find(params[:id])
  question.destroy
  if request.xhr?
    "#{question.id}"
  else
    redirect '/questions'
  end
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.update_attributes(params[:question])
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    @question = Question.find(params[:id])
    erb :'questions/edit'
  end
end

post '/questions/:id/vote' do
  @question = Question.find(params[:id])
  if params[:vote] == "upvote"
    @question.votes.create(value: 1, voter_id: current_user.id)
  elsif params[:vote] == "downvote"
    @question.votes.create(value: -1, voter_id: current_user.id)
  end
  redirect "/questions/#{@question.id}"
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

delete "/questions/:question_id/answers/:id" do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])
  @answer.destroy
  if request.xhr?
    "#{@answer.id}"
  end
end

put "/questions/:question_id/answers/:id" do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])
  if @question.has_best_answer?
    @errors = ['You have already marked another answer as the Best Answer.']
    erb :'questions/show'
  else
    @answer.best_status = 1
    @answer.save
    redirect "/questions/#{@question.id}"
  end
end


post "/questions/:question_id/answers/:id/vote" do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])
  if params[:vote] == "upvote"
    @answer.votes.create(value: 1, voter_id: current_user.id)
  elsif params[:vote] == "downvote"
    @answer.votes.create(value: -1, voter_id: current_user.id)
  end
  redirect "/questions/#{@question.id}"
end


get "/questions/:question_id/answers/:id/edit" do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])
  @to_edit = @answer.id
  erb :'questions/show'
end

put "/questions/:question_id/answers/:id/edit" do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:id])
  @answer.update_attributes(body: params[:body])
  erb :'questions/show'
end

post '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])
  @comment = Comment.new(params[:comment])
  if @comment.save
    @question.comments << @comment
    current_user.comments << @comment
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_message
    erb :'questions/show'
  end
end

delete '/questions/:question_id/comments/:id' do
  @question = Question.find_by(id: params[:question_id])
  @comment = Comment.find_by(id: )
end


