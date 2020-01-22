class GamesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @avail_games = Game.available
  end
  
  def new
    @game = Game.new
  end

  def create 
    @game = Game.create(game_params)
    redirect_to game_path(@game)
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(black_id: current_user.id)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    Game.destroy(params[:id])
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :white_id, :black_id, :user_id)
  end
end
