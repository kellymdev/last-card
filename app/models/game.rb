class Game < ActiveRecord::Base
  DEFAULT_DECK_SIZE = 52

  has_many :deck_cards, dependent: :destroy
  has_many :players, dependent: :destroy
end
