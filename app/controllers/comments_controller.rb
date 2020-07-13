class CommentsController < ApplicationController

    def new 
        @comment = Comment.new
    end

    def index 
        @comments = Comment.all 
    end     

    def show 
    end 

    def delete
        @comment.destroy
        redirect_to root_path
    end  
    
    
    private 

    def comment_params
        params.require(:comment).permit(:content, :user_id, :recipe_id)
    end 

end 
