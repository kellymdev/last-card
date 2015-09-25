class Game < ActiveRecord::Base
  has_many :decks
  has_many :players
end
