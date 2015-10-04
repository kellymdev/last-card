require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "validations" do
    let(:name) { "Fabulous Feline" }

    subject(:player) { Player.new(name: name) }

    context "with a valid name" do
      it { is_expected.to be_valid }
    end

    context "with an invalid name" do
      let(:name) { "Test 123" }

      it { is_expected.to_not be_valid }
    end
  end

  describe "#current_hand" do
    let!(:player) { Player.create!(name: "Jess") }
    let!(:card) { Card.create!(suit: "hearts", value: "3", points: 3) }
    let!(:deck_card) { player.deck_cards.create!(card_id: card.id, has_been_played: false) }

    subject(:current_hand) { player.current_hand }

    context "with a card that hasn't been played" do
      it "returns the card" do
        expect(current_hand).to eq(player.deck_cards)
      end
    end

    context "with one card that has been played, and one that hasn't" do
      let!(:deck_card2) { player.deck_cards.create!(card_id: card.id, has_been_played: true) }

      it "returns the card that hasn't been played" do
        expect(current_hand).to eq(player.deck_cards.where(has_been_played: false))
      end
    end
  end
end
