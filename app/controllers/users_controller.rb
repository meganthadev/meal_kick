class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
      @user = User.new(user_params)
        if @user.save 
           session[:user_id] = @user.id
           redirect_to '/profile' 
        else  
            render :new 
        end 
    end 

    def edit 
        @user = User.find_by(id: params[:id])
    end 

    def show 
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        @user = User.includes(recipes: :category).find_by_id(params[:id])
        redirect_to '/' if !@user
    end 

    def profile
        if logged_in?
         @recipes = Recipe.where(user_id: current_user.id).order(title: :desc)
         @categories = Category.where(user_id: current_user.id).order(name: :desc)
         @user = User.find_by(id: current_user.id)
         @comments = @user.recipe_comments.order(created_at: :desc)
         render :show
        else
          redirect_to '/'
        end
    end 
      
    

      def most_recipes
        @users = User.most_recipes
      end
    
    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end  
    
end
