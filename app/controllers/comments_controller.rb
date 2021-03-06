class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :edit, :update]
    before_action :redirect_if_not_logged_in
    before_action :redirect_if_not_comment_author, only: [:edit, :update]


    def new
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @comment = @recipe.comments.build
          else
            @error = "That recipe doesn't exist" if params[:recipe_id]
            @comment = Comment.new
          end
    end 

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            flash[:message] = "Comment saved!"
            redirect_to comment_path(@comment)
        else
        render :new
        end
    end 

    def show 
    end     

    def edit
    end 

    def update
        if @comment.update(comment_params)
            flash[:message] = "Comment saved!"
            redirect_to comment_path(@comment)
        else
            render :edit
         end
    end 

    def index 
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @comments = @recipe.comments
        else 
            @error = "Oops! This recipe does not exist..." if params[:recipe_id]
            @comments = Comment.all 
        end 
    end 

    private 

    def comment_params
        params.require(:comment).permit(:content,:recipe_id)
      end

    def set_comment
        @comment = Comment.find_by(id: params[:id])
        if !@comment
          flash[:message] = "Comment was not found"
          redirect_to comments_path
        end
      end
    
      def redirect_if_not_comment_author
         redirect_to comments_path if @comment.user != current_user
      end

end