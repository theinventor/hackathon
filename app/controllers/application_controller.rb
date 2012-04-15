class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    User.first
  end
  
  helper_method :current_user

end