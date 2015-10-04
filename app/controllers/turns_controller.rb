class TurnsController < ApplicationController
  before_action :find_game
  before_action :find_deck_card

  def create
    if ValidateTurn.new.call(@game, @deck_card.suit, @deck_card.value)
      Turn.create!(game_id: params[:game_id], deck_card_id: @deck_card.id, player_id: params[:player_id] )
      render json: { test: "test" }
    else
      render json: { error: "Invalid turn" }
    end
  end

  private

  def find_game
    @game ||= Game.find(params[:game_id])
  end

  def find_deck_card
    @deck_card ||= DeckCard.find(params[:placed_card][:id])
  end
end