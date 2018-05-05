class PostsController < ApplicationController
  def create_params
    params.permit(:description, :user_id, :image)
  end

  def index
    @posts = Post.all.order('created_at DESC')
    render json: @posts.as_json(representation: :basic)
  end

  def create
    @user = User.find(1)
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
