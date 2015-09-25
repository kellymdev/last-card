class Game < ActiveRecord::Base
  has_many :decks, dependent: :destroy
  has_many :players, dependent: :destroy
end
