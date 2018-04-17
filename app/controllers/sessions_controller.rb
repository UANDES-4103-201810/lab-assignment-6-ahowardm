class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
    user = User.find_by(email: create_params[:email])
    if user && user.authenticate(create_params[:password])
      log_in user
      flash[:notice] = 'Login successful'
      # redirect_to log_in_path
      redirect_to user
    else
      flash[:notice] = 'Unable to login'
      redirect_to root_url
    end
	end

	def destroy
		#complete this method
		log_out
		redirect_to root_url
  end

  private
    def create_params
      params.require(:session).permit(:email, :password)
    end

    def log_in(user)
      session[:user_id] = user.id
    end

    def log_out
      delete[:user_id]
      @current_user = nil
    end
end
