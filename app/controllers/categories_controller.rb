class CategoriesController < ApplicationController

    def new 
    end 
    
    def create 
    end 
    
    def index 
        @categories = Category.all 
    end 

    def show 
        @category = Category.find_by(id: params[:id])
    end   


end
