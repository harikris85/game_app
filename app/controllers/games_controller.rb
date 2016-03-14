class GamesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  respond_to :json, :html

  def create
  	@game = current_user.games.build(game_params)
    respond_to do |format|
      if @game.save
        @created_game = @game
        @game_info_window = render_to_string(:partial => 'games/show', :layout => false, :format => :html, :locals => { :@game => @game })
        #raise @game_show.inspect
        format.html {redirect_to current_user, notice: 'Game created !'}
        format.json {
          render :json => {
          :saved_game => @created_game, 
          :game_show => @game_info_window
          }
        }
        format.js {render json: @created_game.to_json}
      else
        render 'static_pages/home'
      end
    end
  end

  def destroy
    @game.destroy
    flash[:success] = "Sport deleted"
    redirect_to current_user
  end

  def edit 
    @edit_game = current_user.games.find(params[:id])
  end

  def update 
    @edit_game = current_user.games.find(params[:id])
    @my_game   = @edit_game
      if @edit_game.update_attributes(game_params)
      else
        render 'user/show'
      end
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
