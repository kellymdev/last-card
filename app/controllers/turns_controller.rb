class TurnsController < ApplicationController
  before_action :find_game

  def create
    if ValidateTurn.new.call(@game, suit, value)
      Turn.create!(game_id: params[:game_id], deck_card_id: params[:placed_card][:id], player_id: params[:player_id] )
      render json: { test: "test" }
    else
      render json: { error: "Invalid turn" }
    end
  end

  private

  def find_game
    @game ||= Game.find(params[:game_id])
  end

  def suit
    params[:placed_card][:suit]
  end

  def value
    params[:placed_card][:value]
  end
end