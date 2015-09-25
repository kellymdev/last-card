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
    subject(:game) { CreateGame.new.call }

    context "game creation" do
      it { is_expected.to be_valid }
    end

    context "deck creation" do
      subject(:deck) { game.deck_cards.count }

      it { is_expected.to eq Game::DEFAULT_DECK_SIZE}
    end
  end
end