require 'rails_helper'

RSpec.describe DealDeck, type: :service do
  before { create_cards }

  describe "#call" do
    let(:game) { CreateGame.new.call }
    let!(:player) { Player.new(name: "Lisa") }

    before do
      game.players << player
      DealDeck.new.call(game)
    end

    context "number of cards dealt" do
      subject(:hand) { player.deck_cards.count }

      it { is_expected.to be DeckCard::DEFAULT_HAND_SIZE }
    end
  end
end