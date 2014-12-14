class GamesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  respond_to :json, :html

  def create
  	@game = current_user.games.build(game_params)
    if @game.save
      flash[:success] = "Game created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @game.destroy
    flash[:success] = "Sport deleted"
    redirect_to current_user
  end

  def show
  end

  private

    def game_params
      params.require(:game).permit(:address, :longitude, :latitude, :description, :sport, :game_time)
    end

     def correct_user
      @game = current_user.games.find_by(id: params[:id])
      redirect_to root_url if @game.nil?
    end

end
