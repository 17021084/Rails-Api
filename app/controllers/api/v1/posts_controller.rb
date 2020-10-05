class Api::V1::PostsController < ApplicationController
  before_action :load_post, only: %i[show update destroy]

  def index
    @post = Post.all
    render json: {
      code: 200,
      message: :success,
      data: @post
    }, status: :ok
  end

  def show
    render json: {
      code: 200,
      message: :success,
      data: @post
    }, status: :ok
  end

  def create
    @post = Post.new post_params
    if @post.save
      render json: {
        code: 200,
        message: :created,
        data: @post
      }, status: :created
    else
      render json: {
        code: 500,
        message: @post.error,
        data: @post
      }, status: :unprocessable_entity
    end
  end

  def update
    if @post.update_attributes post_params
      # debugger
      render json: {
        code: 200,
        message: :ok,
        data: @post
      }, status: :ok

    else
      # debugger
      render json: {
        code: 500,
        error: @post.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json:{
      code: 200,
      message: 'delete ok',
      data: @post
    }, status: :ok
  end

  private

  def post_params
    params.permit(:title, :body)
  end

  def load_post
    @post = Post.find params[:id]
    return if @post

    render json: {
      code: 404,
      message: :not_found,
      data: nil
    }, status: :not_found
  end
end
