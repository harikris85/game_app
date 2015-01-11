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
    elsif (game.sport == "Basket ball")
      image = "/assets/basketball.png"
    elsif (game.sport == "Volley ball")
      image = "/assets/volleyball.png"
    elsif (game.sport == "Badminton")
      image = "/assets/badminton.png"
    elsif (game.sport == "Baseball")
      image = "/assets/baseball.png"
    elsif (game.sport == "Billard")
      image = "/assets/billard.png"
    elsif (game.sport == "Chess")
      image = "/assets/chess.png"
    elsif (game.sport == "Climbing")
      image = "/assets/climbing.png"
    elsif (game.sport == "Cycling")
      image = "/assets/cycling.png"
    elsif (game.sport == "Fitness")
      image = "/assets/fitness.png"
    elsif (game.sport == "Golfing")
      image = "/assets/golfing.png"
    elsif (game.sport == "Hangout")
      image = "/assets/hangout.png"
    elsif (game.sport == "Hiking")
      image = "/assets/hiking.png"
    elsif (game.sport == "Jogging")
      image = "/assets/jogging.png"
    elsif (game.sport == "Motorbike")
      image = "/assets/motorbike.png"
    elsif (game.sport == "Squash")
      image = "/assets/squash.png"
    elsif (game.sport == "Swimming")
      image = "/assets/swimming.png"    
    elsif (game.sport == "Table tennis")
      image = "/assets/tabletennis.png" 
    elsif (game.sport == "Tennis")
      image = "/assets/tennis.png"                           
    elsif (game.sport == "US football")
      image = "/assets/usfootball.png" 
    elsif (game.sport == "Yoga")
      image = "/assets/yoga.png"       
    end

  	marker.picture({
  		url: image,
  		width: 32,
  		height: 37
  		})  	
    marker.infowindow render_to_string(:partial => 'games/show', :layout => false, :locals => { :@game => game })   
    end

    @new_game = current_user.games.build if (!current_user.nil?)

  end

  def help
  end

  def about
  end
end
