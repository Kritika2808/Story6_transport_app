class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
    #load_and_authorize_resource
    #p "devise_controller?-->"
    #p devise_controller?
    #check_authorization :unless => :devise_controller?
end
