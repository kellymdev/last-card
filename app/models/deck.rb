class Deck < ActiveRecord::Base
  DEFAULT_DECK_SIZE = 52

  belongs_to :card
  belongs_to :game
  has_many :hands, dependent: :restrict_with_exception
end
