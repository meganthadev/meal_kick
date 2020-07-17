class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
     @category = Category.new
    end 

    def create 
        @category = Category.create(category_params)
        if @category.save
          redirect_to category_path(@category)
        else
          render :new
        end
    end  
    
    
    def index 
        @categories = Category.all.includes(:recipes)
    end 

    def show 
        @category = Category.find_by(id: params[:id])
        @recipes = Recipe.where(category_id: params[:id])
    end   
    
    private 

    def category_params
        params.require(:category).permit(:name, :category_id )
    end 

end
