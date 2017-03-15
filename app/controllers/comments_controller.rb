class CommentsController < ApplicationController

  def createcomment
    @comment = Comment.create(comment: params[:comment], post_id: params[:post_id], user_id:session[:user_id])
    @comment.save
    redirect_to '/homepage/' + session[:user_id].to_s
  end
  
end
