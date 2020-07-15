class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in

    def logged_in?
        !!current_user
    end

    def show 
        @user = User.find_by(id: params[:id])
    end 
    
  private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end 

    
    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end  

    def authorized_to_edit_recipe?(recipe)
        recipe.user == current_user
    end

    def authorized_to_edit_cmnt?(comment)
        comment.user == current_user
    end
    

end
