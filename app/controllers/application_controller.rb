class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_sign_in
  helper_method :is_sign_in?, :current_user

  def is_sign_in?
  	!!session['user_id']
  end

  def current_user
  	User.find(session['user_id']) if session['user_id']
  end

  def check_sign_in
  	unless is_sign_in?
  	 	redirect_to sign_in_path
  	 end 
  end
  
end
