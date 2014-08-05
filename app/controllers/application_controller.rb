class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  #before_filter :auth_user
  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end


end
