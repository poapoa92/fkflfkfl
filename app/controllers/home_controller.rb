class HomeController < ApplicationController
    def index
    end
    def write
        
        new_post=Post.new
        new_post.title=params[:mama]
        new_post.content=params[:baba]
        new_post.save
        
        redirect_to "/list"
        
        
        
    end
    def list
        @every_post = Post.all.order("id desc")
    end
end
