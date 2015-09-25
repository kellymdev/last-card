require 'rails_helper'

RSpec.describe CreateGame, type: :service do
  before do
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        Card.create!(suit: suit, value: value, points: 1)
      end
    end
  end

  describe "#call" do

    context "game creation" do
      subject(:game) { CreateGame.new.call }

      it { is_expected.to be_valid }
    end

    context "deck creation" do
      let(:game) { CreateGame.new.call }

      subject(:deck) { game.deck_cards.count }

      it { is_expected.to eq Game::DEFAULT_DECK_SIZE}

      # it "creates a deck of cards for the game" do
      #   expect(game.deck_cards.count).to eq(Game::DEFAULT_DECK_SIZE)
      # end
    end
  end
end