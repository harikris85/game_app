class StaticPagesController < ApplicationController
  def home
  	@all_games = Game.all
  	if ((cookies[:sport]).nil?) 
  		#@game = @all_games.where(sport: "Football")
      @game = @all_games
    elsif (cookies[:sport] == "All")
      @game = @all_games
  	else
  		@game = @all_games.where(sport: cookies[:sport])
  	end
	@hash = Gmaps4rails.build_markers(@game) do |game, marker|
  	marker.lat game.latitude
  	marker.lng game.longitude
    if (game.sport == "Football")
      image = "/assets/soccer.png"
    elsif (game.sport == "Cricket")
      image = "/assets/cricket.png"
    elsif (game.sport == "Basketball")
      image = "/assets/basketball.png"
    elsif (game.sport == "Volleyball")
      image = "/assets/volleyball.png"
    end

  	marker.picture({
  		url: image,
  		width: 32,
  		height: 37
  		})  	
    marker.infowindow render_to_string(:partial => 'games/show', :layout => false, :locals => { :@game => game })   
    end
  end

  def help
  end

  def about
  end
end
