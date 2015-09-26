class Player < ActiveRecord::Base
  belongs_to :game
  has_many :deck_cards, dependent: :restrict_with_exception

  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z\s]+\z/ }

  validates :score,
    numericality: true

  validates :is_computer,
    default: false
end
