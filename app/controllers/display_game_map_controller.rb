class DisplayGameMapController < ApplicationController
	def create
	  cookies[:sport] = params[:display_game_map][:sport]

	  coords = Geocoder.coordinates(params[:display_game_map][:location])

	  if (coords)
	  	cookies[:lattitude] = coords[0]
	  	cookies[:longitude] = coords[1]
	  end

	  redirect_to root_url
	end

	def destroy
	end	
end
