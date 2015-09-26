card_values = [ ["A", 1], ["2", 2], ["3", 3], ["4", 4], ["5", 5], ["6", 6], ["7", 7], ["8", 50], ["9", 9], ["10", 10], ["J", 10], ["Q", 10], ["K", 10] ]

Card::SUITS.each do |suit|
  card_values.each do |values|
    Card.create(suit: suit, value: values[0], points: values[1])
  end
end
