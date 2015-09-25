class CreateGame
  def call
    game = Game.new
    generate_deck
    game if game.save!
  end

  private

  def generate_deck

  end
end