class ValidateTurn
  def call(game, suit, value)
    @game = game
    matches_suit?(suit) || matches_value?(value) || value_is_eight?(value)
  end

  private

  def matches_suit?(suit)
    suit == @game.turns.last.deck_card.suit
  end

  def matches_value?(value)
    value == @game.turns.last.deck_card.value
  end

  def value_is_eight?(value)
    value == "8"
  end
end