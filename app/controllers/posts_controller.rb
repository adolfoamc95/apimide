class PostsController < ApplicationController
  def create_params
    params.require(:post).permit(:description, :user_id)
  end

  def index
    @posts = Post.all.order('created_at DESC')
    render json: @posts.as_json(representation: :basic)
  end

  def create
    @user = User.find(create_params[:user_id])
    @post = @user.posts.new(create_params)
    if @post.save
      render json: @post.as_json(representation: :basic)
    else
      render json: @post.errors
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy
    render json: {}, status: :ok
  end
end
