class Player < ActiveRecord::Base
  belongs_to :game
  has_many :deck_cards, dependent: :restrict_with_exception
  has_many :turns, dependent: :destroy

  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z\s]+\z/ }

  validates :score,
    numericality: true

  def current_hand
    deck_cards.where(has_been_played: false)
  end
end
