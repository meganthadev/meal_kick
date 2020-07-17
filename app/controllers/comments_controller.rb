class CommentsController < ApplicationController
    before_action :get_comment, only: [:edit, :update, :destroy]
    before_action :set_comments, only: [:edit, :update, :destroy]
    before_action :redirect_if_not_logged_in


    def new
        @comment = Comment.new 
    end 

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
        render :new
        end
    end 

    def edit
    end 

    def update
        @comment.update(comment_params)
        redirect_to recipe_path(@recipe.id)
    end 

    def index 
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @comments = @recipe.comments
        else 
            @error = "Oops! This recipe does not exist..." if params[:recipe_id]
            @comments = Comment.all 
        end 
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

    def authorized_on_recipe?(recipe)
        recipe.user == current_user
    end 

end