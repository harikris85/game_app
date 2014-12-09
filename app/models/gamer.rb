class Gamer < ActiveRecord::Base
	belongs_to :player, class_name: "User"
	belongs_to :going_game, class_name: "Game"
end
