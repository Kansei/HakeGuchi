class Api::V1::PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.save!

    render :show, status: :created
  end

  def update
    @post = Post.find(params[:id])
    @post.sympathy += 1
    @post.save!

    render :show, status: :ok
  end

  private

  def post_params
    params.require(:posts).permit(:text)
  end
end
