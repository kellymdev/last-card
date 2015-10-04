require 'rails_helper'

RSpec.describe TurnsController, type: :controller do
  describe "#create" do
    before { create_identical_cards }

    let!(:game) { CreateGame.new.call }
    let!(:player) { Player.create!(name: "Lisa") }
    let!(:deck) { DealDeck.new.call(game) }

    it "increases the number of turns by one" do
      expect { post :create, game_id: game.id, player_id: player.id, placed_card: { id: game.deck_cards.last.id } }.to change { Turn.count }.by 1
    end

    it "returns the played card and the new card for the player as json" do
      post :create, game_id: game.id, player_id: player.id, placed_card: { id: game.deck_cards.last.id }

      json_response = {
                        card_for_deck: {
                          suit: game.turns.last.deck_card.suit,
                          value: game.turns.last.deck_card.value
                        },
                        card_for_player: {
                          deck_card_id: game.next_card_from_deck.id,
                          suit: game.next_card_from_deck.suit,
                          value: game.next_card_from_deck.value
                        }
                      }

      expect(response.body).to eq(json_response.to_json)
    end
  end
end