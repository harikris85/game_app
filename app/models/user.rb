class User < ActiveRecord::Base
  has_many :games, dependent: :destroy
  has_many :gamers, foreign_key: "player_id", dependent: :destroy
  has_many :going_games, through: :gamers, source: :going_game
  before_save { self.email = email.downcase }
  before_create :create_remember_token	
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def already_going?(this_game)
    gamers.find_by(going_game_id: this_game.id)
  end

  def going!(this_game)
    gamers.create!(going_game_id: this_game.id)
  end

  def not_going!(this_game)
    gamers.find_by(going_game_id: this_game.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
  
end
