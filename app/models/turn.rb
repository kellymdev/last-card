class Turn < ActiveRecord::Base
  belongs_to :player
  belongs_to :deck_card
  belongs_to :game
end
