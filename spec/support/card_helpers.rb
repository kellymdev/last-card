module CardHelpers
  def create_cards
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        Card.create!(suit: suit, value: value, points: 1)
      end
    end
  end

  def create_identical_cards
    52.times { Card.create!(suit: 'hearts', value: '3', points: 1) }
  end
end
