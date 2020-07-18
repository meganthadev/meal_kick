class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    before_action :get_category


    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @recipe = @user.recipes.build
      else
        @recipe = Recipe.new
      end
      @recipe.build_category
    end   

    def create 
      @recipe = current_user.recipes.build(recipe_params)
      @category = @recipe.category_id
      if @recipe.save
        flash[:message] = "Recipe saved!"
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
    end

    def show 
    end  

     def update
        if @recipe.update(recipe_params)
          flash[:message] = "Recipe saved!"
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
        flash[:message] = "Recipe deleted!"
        redirect_to recipes_path   
    end 

    private 

    def recipe_params
        params.require(:recipe).permit(:title, :description, :instructions, :category_id, category_attributes: [:name, :id])
    end 

    def set_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end 

    def get_category
      @category = Category.find_by_id(params[:category_id])
    end
end
