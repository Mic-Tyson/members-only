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
    @post.user_id = current_user.id

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      flash.now[:error] = @post.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find params[:id]
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
