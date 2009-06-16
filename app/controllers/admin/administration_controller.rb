class Admin::AdministrationController < ApplicationController
  before_filter :admin_authenticate
  # layout 'administration'
  private
  def admin_authenticate
    unless session[:user_id] and ( User.find(session[:user_id]).class.name == 'Editor' )
      session[:return_to] = request.request_uri
      redirect_to auth_path and return
    end
  end
  
end