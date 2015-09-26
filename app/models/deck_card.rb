class DeckCard < ActiveRecord::Base
  DEFAULT_HAND_SIZE = 8

  belongs_to :card
  belongs_to :game
  belongs_to :player
end
