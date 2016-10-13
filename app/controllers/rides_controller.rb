class RidesController < ApplicationController

	def create
		attraction = Attraction.find(params[:id])
		@user = current_user
		ride = Ride.new(user_id: @user.id, attraction_id: attraction.id)

		# puts "tickets before ride: #{ride.user.tickets}"
		session[:ride_outcome] = ride.take_ride
		# puts "tickets AFTER ride: #{ride.user.tickets}"
		
		if session[:ride_outcome] == ride.thank_you_statement
			ride.save
			redirect_to user_path(@user)
		else
			redirect_to user_path(@user)
		end
	end
end