class RegistrationsController < ApplicationController
	def new
	
	end

	def create
    #complete this method
    @user = User.new(create_params)
    if @user.save
      flash[:notice] = 'Sign up successful'
      redirect_to @user
    else
      flash[:notice] = 'Unable to sign up'
      redirect_to sign_in_url
    end
	end

	private
  def create_params
    params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
  end
end
