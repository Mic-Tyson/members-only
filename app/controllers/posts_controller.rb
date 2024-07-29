class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      flash.now[:alert] = 'Unable to save Post.'
      render :new, status: :unprocessable_entity 
    end
  end

  def show
    @post = Post.find params[:id]
  end
end
