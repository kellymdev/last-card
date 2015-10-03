require 'rails_helper'

RSpec.describe TurnsController, type: :controller do
  describe "#create" do
    let!(:game) { CreateGame.new.call }
    let!(:player) { Player.create!(name: "Lisa") }

    xit "increases the number of turns by one" do
      expect { post :create, game_id: game.id, player_id: player.id, placed_card: { suit: 'hearts', value: 6 } }.to change { Turn.count }.by 1
    end
  end
end