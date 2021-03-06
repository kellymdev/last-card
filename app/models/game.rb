class Game < ActiveRecord::Base
  DEFAULT_DECK_SIZE = 52

  has_many :deck_cards, dependent: :destroy
  has_many :cards, through: :deck_cards
  has_many :players, dependent: :destroy
  has_many :turns, dependent: :restrict_with_exception

  def next_card_from_deck
    cards_in_deck.order(:sequence_number).first
  end

  private

  def cards_in_deck
    deck_cards.where(has_been_played: false, player_id: nil)
  end
end
