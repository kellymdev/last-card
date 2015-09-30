require 'rails_helper'

RSpec.describe Game, type: :model do
  let!(:card) { Card.create!(value: 3, suit: "hearts", points: 3) }
  let!(:card2) { Card.create!(value: 9, suit: "clubs", points: 9) }
  let(:game) { CreateGame.new.call }

  describe "#next_card" do
    subject { game.next_card }

    it { is_expected.to eq card.deck_cards.first }
  end
end
