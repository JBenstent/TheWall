class UserController < ApplicationController
  def index
  end

  def createuser
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    @user.save
    redirect_to '/homepage/' + @user.id.to_s
  end

  def validate
    @user = User.find_by(username: params[:username], email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/homepage/" + @user.id.to_s
    else
      flash[:errors]= ["Could not find username. Please try again or create new account!"]
      redirect_to "/"
    end
  end

  def homepage
    @posts = Post.all
    render 'homepage'
  end

  def deletepost
    @post = Post.find(params[:id])
    if @post.user_id == session[:user_id]
      @post.destroy
    else
      flash[:errors] = ["You cannot delete a post you did not create."]
    end
    redirect_to "/homepage/" + session[:user_id].to_s
  end


  def logout
    session[:user_id] = 0
    redirect_to "/"
  end
end
