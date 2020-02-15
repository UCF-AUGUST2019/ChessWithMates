class PiecesController < ApplicationController  
  skip_before_action :verify_authenticity_token
  
  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    if @piece.color == "black" && @piece.game.white_player.username == current_user.username
      render :text, status: :unprocessable_entity
    end

    if @piece.color == "white" && @piece.game.white_player.username == current_user.username 
      @piece.update_attributes(piece_params)
    end

  end

  private 

  def piece_params 
		params.require(:piece).permit(:type, :x_pos, :y_pos, :game_id, :player_id)
	end

end
