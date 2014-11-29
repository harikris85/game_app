class Game < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode
	belongs_to :user
	validates :user_id, presence: true
end
