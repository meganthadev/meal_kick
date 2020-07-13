class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @recipe = Recipe.new
    end 

    def create 
        @recipe = current_user.recipes.build(recipe_params)
         #if @recipe.save 
            render :'recipes/show'
        #else 
            #render :new
        #end 
     end 

     def show 
        @recipe = Recipe.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe
     end  
    
    def index 
        @recipes = Recipe.all
      end   

    private 

    def recipe_params
        params.require(:recipe).permit(:title, :description, :instructions)
    end 


end
