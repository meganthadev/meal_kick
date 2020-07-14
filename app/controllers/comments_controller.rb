class CommentsController < ApplicationController
    before_action :get_comment, only: [:edit, :update, :destroy]
    before_action :set_comments, only: [:edit, :update, :destroy]
    before_action :redirect_if_not_logged_in


    def new
        @comment = Comment.new 
    end 

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.recipe_id = params[:recipe_id]
        @comment.save
        redirect_to recipe_path(@comment.recipe)
    end

    def edit
    end 

    def update
        @comment.update(comment_params)
        redirect_to recipe_path(@recipe)
    end 
  
    def destroy
        @comment.destroy
        redirect_to recipe_path(@recipe)
    end

    private 

    def get_comment
        @comment = Comment.find_by(id: params[:id])
    end 

    def set_comments
        @recipe = @comment.recipe 
        @comments = @recipe.comments.find_by(id: params[:id])
    end 
        
    def comment_params
        params.require(:comment).permit(:content, :recipe_id)
    end 

end