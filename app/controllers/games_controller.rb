class GamesController < ApplicationController
  before_action :signed_in_user
  respond_to :json, :html

  def create
  	@game = current_user.games.build(game_params)
    if @game.save
      flash[:success] = "Game created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def show
  end

  private

    def game_params
      params.require(:game).permit(:address, :longitude, :latitude, :description, :sport)
    end

end
