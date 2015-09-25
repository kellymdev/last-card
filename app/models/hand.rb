class Hand < ActiveRecord::Base
  DEFAULT_CARD_COUNT = 8

  belongs_to :deck_card
  belongs_to :player
end
