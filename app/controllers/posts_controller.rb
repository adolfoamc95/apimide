class PostsController < ApplicationController
  def create_params
    params.require(:post).permit(:description, :user_id)
  end

  def index
    @posts = Post.all.order('created_at DESC')
    render json: @posts
  end

  def create
    @user = User.find(create_params[:user_id])
    @post = @user.posts.new(create_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors
    end
  end
end
