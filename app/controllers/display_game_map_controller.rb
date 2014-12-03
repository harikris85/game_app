class DisplayGameMapController < ApplicationController
	def create
	  cookies[:sport] = params[:display_game_map][:sport]
	  redirect_to root_url
	end

	def destroy
	end	
end
