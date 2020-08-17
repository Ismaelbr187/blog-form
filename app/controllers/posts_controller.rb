class PostsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", except: [:index]

  def index
    @posts = Post.order("created_at DESC")
  end

  def dashboard
    @post = Post.new
  end

  def create

    @post = Post.new 
    temp_content = params[:post][:content].gsub! 'spoiler', ''
    

    @post = Post.create(
      title: params[:post][:title],
      image_url: params[:post][:image_url],
      content: params[:post][:content]
    )

    if @post.valid?
      @post.save
      redirect_to root_path, notice: 'Post was succesfully created.'
    else
      redirect_to root_path, alert: 'Post was not created.'
    end
  end
end
