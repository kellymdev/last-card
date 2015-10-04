require 'rails_helper'

RSpec.describe TurnsController, type: :controller do
  describe "#create" do
    before { create_identical_cards }

    let!(:game) { CreateGame.new.call }
    let!(:player) { Player.create!(name: "Lisa") }
    let!(:deck) { DealDeck.new.call(game) }

    it "increases the number of turns by one" do
      expect { post :create, game_id: game.id, player_id: player.id, placed_card: { id: game.deck_cards.last.id, suit: 'hearts', value: '3' } }.to change { Turn.count }.by 1
    end
  end
end