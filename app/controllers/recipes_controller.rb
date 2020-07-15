class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in

    def new 
        @recipe = Recipe.new
        @comment = Comment.new
        @comment.recipe_id = @recipe.id 
    end 

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else 
           render :new
        end 
     end 

     def show 
        @comment = Comment.new 
     end  

     def update
        if @recipe.update(recipe_params)
          redirect_to recipe_path(@recipe)
        else  
          render 'edit'
        end  
      end
    
    def index 
        @recipes = Recipe.all
    end   

    def destroy
        @recipe.destroy
        redirect_to recipes_path   
    end 

    private 

    def recipe_params
        params.require(:recipe).permit(:title, :description, :instructions, 
        :user_id, :category_id, category_attributes[:title], user_attributes[:username])
    end 

    def set_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end 
    
    def authorized_on_recipe?(recipe)
        recipe.user == current_user
    end 



end
