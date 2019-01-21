require 'byebug'

class Api::V1::PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def create
    @post = Post.new(post_params)

    unless @post.save
      render json: @post.errors, status: :unprocessable_entity
    end

    render :show, status: :created
  end

  def update
    @post = Post.find(params[:id])

    @post.sympathy += 1

    @post.save!

    render :show, status: :ok

    rescue => error
      render json: {message: error}, status: :unprocessable_entity
  end

  private

  def post_params
    params.require(:posts).permit(:text)
  end
end
