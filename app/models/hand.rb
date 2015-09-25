class Hand < ActiveRecord::Base
  DEFAULT_CARD_COUNT = 8

  belongs_to :deck
  belongs_to :player
end