class PlayersController < ApplicationController
  before_action :find_game

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @game
    else
      render :new
    end
  end

  private

  def find_game
    @game = Game.find(params[:game_id])
  end

  def player_params
    params.require(:player).permit(:name)
  end
end