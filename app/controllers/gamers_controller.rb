class GamersController < ApplicationController
  before_action :signed_in_user

  def create
  	@game = Game.find(params[:going_game_id])
  	current_user.going!(@game)
    respond_to do |format|
      format.html { redirect_to @current_user }
      format.js
    end
  end

  def destroy
  	@game = Gamer.find(params[:id]).going_game
  	current_user.not_going!(@game)
    respond_to do |format|
      format.html { redirect_to @current_user }
      format.js
    end
  end

end
