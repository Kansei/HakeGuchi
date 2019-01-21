class Api::V1::PostController < ApplicationController
  def index
    # @post = @post
  end

  def create
    @post = Post.new(post_params)

    unless @post.save
      render json: @post.errors, status: :unprocessable_entity
    end

    @sympathy = @post.symapathy.create()

  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
