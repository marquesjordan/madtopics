class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  

  def current_user
  	@current_user ||= User.where(id: session[:user_id]).first
  end

  def find_topic(t_id)
    Topic.find(t_id)  
  end


  private

  # def confirm_logged_in
  # 	unless session[:user_id]
  # 		flash[:notice] = "Please log in."
  # 		redirect_to(:controller => 'pages', :action => 'home')
  # 		return false
  # 	else
  # 		return true
  # 	end
  # end


end
