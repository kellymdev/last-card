class ValidateTurn
  def call(game, suit, value)
    @game = game
    matches_value?(value) || matches_suit?(suit)
  end

  private

  def matches_suit?(suit)
    suit == @game.turns.last.deck_card.suit
  end

  def matches_value?(value)
    value == @game.turns.last.deck_card.value
  end
end