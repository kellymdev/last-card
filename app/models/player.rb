class Player < ActiveRecord::Base
  belongs_to :game
  has_many :hands, dependent: :destroy

  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z\s]+\z/ }

  validates :score,
    numericality: true
end
