class PostsController < ApplicationController

  def createpost
    @post = Post.create(content: params[:content], user: User.find(session[:user_id]))
    redirect_to '/homepage/' + session[:user_id].to_s
  end



end
