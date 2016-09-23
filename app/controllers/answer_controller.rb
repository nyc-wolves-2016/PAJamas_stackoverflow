get '/answers/:answer_id/comments/new' do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
  if request.xhr?
    erb :'comments/_new', locals: {commentable: @answer}, layout: false
  else
  @new_comment = true
  erb :'questions/show'
  end
end

post '/answers/:answer_id/comments' do

  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
  @comment = Comment.new(params[:comment])
  if @comment.save && request.xhr?
    @answer.comments << @comment
    current_user.comments << @comment
    erb :'comments/_new', locals: {commentable: @answer, comment: @comment }, layout: false
  elsif @comment.save
    @answer.comments << @comment
    current_user.comments << @comment
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_message
    erb :'questions/show'
  end
end

delete '/answers/:answer_id/comments/:id' do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
  @comment = Comment.find_by(id: params[:id])
  @comment.destroy
  redirect "/questions/#{@question.id}"
end

get "/answers/:answer_id/comments/:id/edit" do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
  @to_edit = Comment.find_by(id: params[:id]).id
  erb :'questions/show'
end

put "/answers/:answer_id/comments/:id" do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
  @comment = Comment.find_by(id: params[:id])
  @comment.update_attributes(body: params[:body])
  erb :'questions/show'
end
