class PostsController < ApplicationController

    private def post_params
        params.require(:post).permit(:image, :caption)
    end
    
    def index
        @posts = Post.all
    end
    
    def new
       @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to posts_path
    end
    
  
end
