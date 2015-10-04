require 'rails_helper'

RSpec.describe ValidateTurn, type: :service do
  before { create_identical_cards }

  let!(:game) { CreateGame.new.call }
  let!(:deck) { DealDeck.new.call(game) }
  let!(:turn) { Turn.create!(game_id: game.id, deck_card_id: game.deck_cards.first.id) }
  let(:suit) { "hearts" }
  let(:value) { "3" }

  describe "#call" do
    subject { ValidateTurn.new.call(game, suit, value) }

    context "with a matching suit and value" do
      it { is_expected.to be true }
    end

    context "with a matching suit" do
      let(:value) { "5" }

      it { is_expected.to be true }
    end

    context "with a matching value" do
      let(:suit) { "diamonds" }

      it { is_expected.to be true }
    end

    context "with a value of 8" do
      let(:suit) { "spades" }
      let(:value) { "8" }

      it { is_expected.to be true }
    end

    context "when the suit and value don't match" do
      let(:suit) { "diamonds" }
      let(:value) { "10" }

      it { is_expected.to be false }
    end
  end
end
