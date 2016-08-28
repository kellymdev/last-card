require 'rails_helper'

RSpec.describe TurnsController, type: :controller do
  describe "#create" do
    before { create_identical_cards }
    let!(:game) { CreateGame.new.call }
    let!(:player) { Player.create!(name: "Lisa") }
    let!(:deck) { DealDeck.new.call(game) }

    context "valid turn" do
      it "increases the number of turns by one" do
        expect { post :create, params: { game_id: game.id, player_id: player.id, placed_card: { id: game.deck_cards.last.id } } }.to change { Turn.count }.by 1
      end

      it "returns the played card and the new card for the player as json" do
        post :create, params: { game_id: game.id, player_id: player.id, placed_card: { id: game.deck_cards.last.id } }

        next_card = game.deck_cards.where(has_been_played:false, player_id: nil).order(:sequence_number).first

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

    context "invalid turn" do
      before do
        @card = game.deck_cards.last
        @card.card.update_attributes!(suit: "diamonds", value: "10")
      end

      it "returns an error message" do
        post :create, params: { game_id: game.id, player_id: player.id, placed_card: { id: @card.id } }

        error = { error: "Invalid move" }

        expect(response.body).to eq(error.to_json)
      end
    end
  end
end
