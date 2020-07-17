class SessionsController < ApplicationController 

    def new 
      @user = User.new
    end 

    def home
    end 

    def create 
       user = User.find_by(email: params[:user][:email])
       if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id 
        redirect_to user_path(user)
       else 
        flash[:error] = "Incorrect login credentials. Please try again."
        redirect_to '/login'
       end 
    end 

    def destroy 
      session.clear
      redirect_to '/'
    end 

    def google
      #find_or_create a user using the attributes auth
      @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
    end
  

    private

    def auth
      request.env['omniauth.auth']
    end
  

end  