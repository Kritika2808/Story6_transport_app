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

  def auth_user
      p new_user_session_url
    begin
      p "user_signed_in?"
      p user_signed_in?
      redirect_to new_user_session_path unless user_signed_in?
    rescue e
      p "exce[tion"
      p e.received_message?
      redirect_to new_user_session_path
    end
  end
end
