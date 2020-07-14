class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :authorized?, only: [:edit, :destroy]
    before_action :redirect_if_not_logged_in

    def new 
        @recipe = Recipe.new
        @comment = Comment.new
        @comment.recipe_id = @recipe.id 
    end 

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        binding.pry
        if @recipe.save
            binding.pry
            redirect_to recipes_path(@recipe)
        else 
            render :new
        end 
     end 

     def show 
        @recipe = Recipe.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe
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
        params.require(:recipe).permit(:title, :description, :instructions)
    end 

    def set_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end 
    
    def authorized?(recipe)
        recipe.user == current_user
    end 



end
