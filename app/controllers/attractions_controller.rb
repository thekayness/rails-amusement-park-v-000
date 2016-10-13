class AttractionsController < ApplicationController

	def index
		@attractions = Attraction.all
	end

	def show
		@attraction = Attraction.find(params[:id])
		@user = current_user
	end

	def new
		@attraction = Attraction.new
	end

	def create
		@attraction = Attraction.create(attraction_params)
		if @attraction.save
			redirect_to attraction_path(@attraction)
		else
			redirect_to attraction_new_path(@attraction)
		end
	end

	def edit
		@attraction = Attraction.find(params[:id])
	end

	def update
		@attraction = Attraction.find(params[:id])
		@attraction.update(attraction_params)
		if @attraction.save
			redirect_to attraction_path(@attraction)
		else
			redirect_to attraction_edit_path(@attraction)
		end
	end

	private
	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end



end