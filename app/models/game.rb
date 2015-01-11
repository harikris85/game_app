class Game < ActiveRecord::Base
	validates :address, presence: true
	geocoded_by :address
	after_validation :geocode
	belongs_to :user
	validates :user_id, presence: true

	has_many :reverse_gamers, foreign_key: "going_game_id", class_name: "Gamer", dependent: :destroy
	has_many :players, through: :reverse_gamers, source: :player

end
