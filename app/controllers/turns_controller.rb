class TurnsController < ApplicationController
  before_action :find_game
  before_action :find_deck_card
  before_action :find_player

  def create
    if ValidateTurn.new.call(@game, @deck_card.suit, @deck_card.value)
      @deck_card.has_been_played = true
      @deck_card.save!

      Turn.create!(game_id: @game.id, deck_card_id: @deck_card.id, player_id: @player.id )

      @player.deck_cards << @game.next_card_from_deck

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
      render json: { error: "Invalid move" }
    end
  end

  private

  def find_game
    @game ||= Game.find(params[:game_id])
  end

  def find_deck_card
    @deck_card ||= DeckCard.find(params[:placed_card][:id])
  end

  def find_player
    @player ||= Player.find(params[:player_id])
  end
end
