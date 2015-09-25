class Player < ActiveRecord::Base
  belongs_to :game

  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z\s]+\z/ }

  validates :score,
    numericality: true
end
