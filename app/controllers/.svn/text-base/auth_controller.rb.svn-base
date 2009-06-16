class AuthController < ApplicationController
  def index
    if session[:user_id]
      flash[:notice] = 'You are already logged in.'
      redirect_to '/' and return
    end
  end
  
  
  def login
    user = User.find(:first, :conditions => {:user_name => params[:user_name], :password => params[:password]})
    if user
      session[:user_id] = user.id
      user = User.find(user.id)
      redirect_to session[:return_to] ||= home_path and return
    else
      flash[:notice] = 'Your username or password were not recognized.'
      render :action => 'index'
    end
  end
  
  def logout
    reset_session
    redirect_to :controller => 'home'
  end
  
  def send_password
    user = User.find(:first, :conditions => {:email => params[:email]})
    if user
      Notifier.deliver_password(user)
      flash[:notice] = 'Your password was emailed to your address.'
      render :action => 'index' and return
    else
      flash[:notice] = 'Your password was not found in our database.'
      render :action => 'forgot_password'
    end
  end
  
end
