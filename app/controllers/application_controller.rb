class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	#complete this method
    User.find_by(id: session[:id])
  end

  def is_user_logged_in?
	  #complete this method
  	#logged_in = false
	  #if logged_in then true else redirect_to root_path end
    if !@current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
    end
  end
end
