class StaticPagesController < ApplicationController
  def home
  	@all_games = Game.all
  	if ((cookies[:sport]).nil?) 
  		#@game = @all_games.where(sport: "Football")
      @game = @all_games
  	else
  		@game = @all_games.where(sport: cookies[:sport])
  	end
	@hash = Gmaps4rails.build_markers(@game) do |game, marker|
  	marker.lat game.latitude
  	marker.lng game.longitude
  	marker.picture({
  		url: "/assets/images/cricket.png",
  		width: "32",
  		height: "32"
  		})  	
    marker.infowindow render_to_string(:partial => 'games/show', :layout => false, :locals => { :@game => game })   
    end
  end

  def help
  end

  def about
  end
end
