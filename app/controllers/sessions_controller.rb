class SessionsController < ApplicationController
		
	# before_action :confirm_logged_in, :except => [:new, :create, :destroy]
	skip_before_filter :authorize
	def new
		# Present an empty login form
		@user = User.new
		@is_login = true
	end

	def create
		# Find the user that is trying to log in		
		u = User.where(email: params[:user][:email]).first
		if u && u.authenticate(params[:user][:password])
			# Store as a cookie in the users' browser the ID of them,
			# indicating that they are logged in
			session[:user_id] = u.id.to_s
			redirect_to questions_path
		else
			# Go back to the login page
			redirect_to new_sessions_path
		end
	end

	def destroy
		reset_session
		redirect_to root_path
	end
end