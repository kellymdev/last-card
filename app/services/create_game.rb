class CreateGame
  def call
    @game = Game.new
    create_deck
    create_computer_player
    @game if @game.save!
  end

  private

  def create_deck
    Card.all.each do |card|
      @game.cards << card
    end
  end

  def create_computer_player
    @game.players << Player.new(name: "Bella", is_computer: true)
  end
end