class DeckCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :game
  has_many :hands, dependent: :restrict_with_exception
end
