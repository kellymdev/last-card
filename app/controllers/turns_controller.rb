class TurnsController < ApplicationController
  before_action :find_game
  before_action :find_deck_card

  def create
    if ValidateTurn.new.call(@game, @deck_card.suit, @deck_card.value)
      Turn.create!(game_id: params[:game_id], deck_card_id: @deck_card.id, player_id: params[:player_id] )
      render json: {
                    card_for_deck: {
                      suit: @game.turns.last.deck_card.suit,
                      value: @game.turns.last.deck_card.value
                    },
                    card_for_player: {
                      deck_card_id: @game.next_card_from_deck.id,
                      suit: @game.next_card_from_deck.suit,
                      value: @game.next_card_from_deck.value
                    }
                  }
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