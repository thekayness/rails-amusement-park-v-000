class UsersController < ApplicationController

	def index
	end

	def signin
		@user = User.new
	end

	def show
		if logged_in?
			# puts "hallo"
			@user = current_user
			if ride_outcome?
				flash[:notice] = ride_outcome_statement
			end
		else
			redirect_to '/'
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			#puts "yyyyyy"
			session[:user_id] = @user.id
			# puts "session #{session[:user_id]}"
			redirect_to user_path(@user)
		else
			redirect_to '/'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
	end


end
