class PostsController < ApplicationController
  before_action :set_post, only:[:show,:edit,:update,:destroy]
  
  private def post_params
    params.require(:post).permit(:image, :caption)
  end
  
  private def set_post
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post could'nt be created, please check the form"
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update  
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else 
      flash.now[:alert] = "Update failed. Please check the form"
      render :edit
    end
  end  
  
  def destroy
    if @post.destroy
      flash[:success] = "Post deleted."
      redirect_to posts_path
    else 
      flash[:alert] = "Post deletion failed."
      redirect_to posts_path
    end
  end
end
