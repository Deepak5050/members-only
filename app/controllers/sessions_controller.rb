class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  		if user && user.authenticate(params[:session][:password])
  			flash[:success] = "Successfully logged in"
  			log_in(user)
  			redirect_to root_path
  		else
  			flash.now[:danger] = "Invalid username/password"
  			render 'new'
  		end

  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
