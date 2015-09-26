class DealDeck
  def call(game)
    @game = game
    shuffle_cards
    DeckCard::DEFAULT_HAND_SIZE.times { assign_a_card_to_each_player }
  end

  private

  def shuffle_cards
    cards = @game.deck_cards.shuffle
    cards.each_with_index do |card, sequence_number=1|
      card.sequence_number = sequence_number
      card.save!
    end
  end

  def assign_a_card_to_each_player
    @game.players.each do |player|
      deck_card = DeckCard.where(player_id: nil).order(:sequence_number).first
      deck_card.player = player
      deck_card.save!
    end
  end
end