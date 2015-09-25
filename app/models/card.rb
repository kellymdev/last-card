class Card < ActiveRecord::Base
  VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  SUITS = %w(hearts clubs spades diamonds)
  POINTS = %w(1 2 3 4 5 6 7 8 9 10 50)

  has_many :decks, dependent: :restrict_with_exception

  validates :value,
    presence: true,
    inclusion: { in: VALUES }

  validates :suit,
    presence: true,
    inclusion: { in: SUITS }

  validates :points,
    presence: true,
    inclusion: { in: POINTS }
end
