class GamesController < ApplicationController
  before_action :authenticate_user!, only: %w[create]
  
  def index
    if user_signed_in?
      @avail_games = Game.available
    else
      redirect_to root_path, alert: 'You must be Signed In.'
    end
  end
  
  def new
   @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to(@game)
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(black_id: current_user.id)
    redirect_to game_path(@game)
  end

  def show
    #@game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name, :white_id, :black_id, :user_id)
  end
end
