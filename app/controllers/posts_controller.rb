class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
  end

  def dashboard
    @post = Post.new
  end

  def create
  end
end
