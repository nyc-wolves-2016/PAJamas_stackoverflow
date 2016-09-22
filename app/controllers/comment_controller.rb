post "/comments/:id/vote" do
  @comment = Comment.find(params[:id])
  if params[:vote] == "upvote"
    @comment.votes.create(value: 1, voter_id: current_user.id)
  elsif params[:vote] == "downvote"
    @comment.votes.create(value: -1, voter_id: current_user.id)
  end
  if @comment.commentable_type == "Question"
    redirect "/questions/#{@comment.commentable_id}"
  elsif @comment.commentable_type == "Answer"
    @answer = Answer.find(@comment.commentable_id)
    redirect "/questions/#{@answer.question.id}"
  end
end
