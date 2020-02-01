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

  def concede
    @game = Game.find(params[:id])
    if current_user.id == @game.white_id
      @game.update_attributes(winner: @game.black_id)
    else
      @game.update_attributes(winner: @game.white_id)
    end
    @game.update_attributes(game_over: true)
    redirect_to games_path
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
    params.require(:game).permit(:name, :white_id, :black_id, :user_id, :game_over, :winner)
  end
end
