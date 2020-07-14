class SessionsController < ApplicationController 

    def home
    end 

    def create 
       @user = User.find_by(email: params[:email])
       if @user
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
       else 
        flash[:message] = "Incorrect login credentials. Please try again."
        redirect_to "/login"
       end 
    end 

    def destroy 
      session.clear
      redirect_to root_path
    end 



end  