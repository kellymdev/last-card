require 'rails_helper'

RSpec.describe CreateGame, type: :service do
  before { create_cards }

  describe "#call" do
    subject(:game) { CreateGame.new.call }

    context "game creation" do
      it { is_expected.to be_valid }

      it "increases the number of games by one" do
        expect { CreateGame.new.call }.to change { Game.count }.by 1
      end
    end

    context "deck creation" do
      subject(:deck) { game.deck_cards.count }

      it { is_expected.to eq Game::DEFAULT_DECK_SIZE }
    end

    context "computer player creation" do
      it "increases the number of players by one" do
        expect { CreateGame.new.call }.to change { Player.count }.by 1
      end
    end
  end
end
