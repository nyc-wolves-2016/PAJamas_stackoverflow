post '/answers/:answer_id/comments/new' do

  @answer = Answer.find_by(id: params[:answer_id])
  @answer = @answer.question
  @comment = Comment.new(params[:comment])
  if @comment.save
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