class SessionsController < ApplicationController
  def create 
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to products_path, notice: "Logged in!"
  	else
  		# redirect_to products_path, notice: "Email/Password is invalid"
  		flash[:error] = "Email/Password is invalid"
  		render "new", notice: "Email/Password is invalid"
  	end
  end

  def destroy
  	session[:user_id] = nil
    reset_session
  	redirect_to root_url
  end
end
