class ApplicationController < ActionController::Base
	include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
		session.include?(:user_id)
	end

	def current_user
		user = User.find(session[:user_id])
		# puts "user found #{user.name}"
	end

	def ride_outcome?
		session.include?(:ride_outcome)
	end

	def ride_outcome_statement
		session[:ride_outcome]
	end

	def clear_ride
		session.delete(:ride_outcome)
	end

end
