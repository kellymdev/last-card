class DealDeck
  def call(game)
    @game = game
    shuffle_cards
    DeckCard::DEFAULT_HAND_SIZE.times { assign_a_card_to_each_player }
    turn_first_card
  end

  private

  def shuffle_cards
    cards = @game.deck_cards.shuffle
    cards.each_with_index do |card, sequence_number = 1|
      card.sequence_number = sequence_number
      card.save!
    end
  end

  def assign_a_card_to_each_player
    @game.players.each do |player|
      deck_card = @game.next_card_from_deck
      deck_card.player = player
      deck_card.save!
    end
  end

  def turn_first_card
    card = @game.next_card_from_deck
    card.has_been_played = true
    Turn.create!(game_id: @game.id, deck_card_id: card.id)
  end
end
