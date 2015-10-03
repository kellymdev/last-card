require 'rails_helper'

RSpec.describe GamePresenter, type: :presenter do
  before { create_identical_cards }

  let!(:game) { CreateGame.new.call }
  let!(:deck) { DealDeck.new.call(game) }
  let!(:game_presenter) { GamePresenter.new(game) }
  let!(:turn) { Turn.create!(game_id: game.id, deck_card_id: game.deck_cards.first.id) }

  describe "#suit_for_last_turn" do
    subject { game_presenter.suit_for_last_turn }

    it { is_expected.to eq "hearts" }
  end

  describe "#value_for_last_turn" do
    subject { game_presenter.value_for_last_turn }

    it { is_expected.to eq '3' }
  end
end