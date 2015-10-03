class GamePresenter < SimpleDelegator
  def suit_for_last_turn
    turns.last.deck_card.suit
  end

  def value_for_last_turn
    turns.last.deck_card.value
  end
end