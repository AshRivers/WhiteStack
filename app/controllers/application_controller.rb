class ApplicationController < ActionController::Base
  protect_from_forgery

  private 

  	def current_cart
  		Cart.find(session[:cart_id])
  	rescue 	ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end

  	def current_user
  		@current_user = User.find(session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

  	def ensure_login 
  		redirect_to login_path, alert: "Not authorized" if current_user.nil?
  	end

    def ensure_admin
      redirect_to root_path, alert: "Not enough privelegs" if !current_user.admin?
    end

end
