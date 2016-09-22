post '/answers/:answer_id/comments/new' do

  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
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