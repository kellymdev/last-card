class CreateGame
  def call
    @game = Game.new
    generate_deck
    @game if @game.save!
  end

  private

  def generate_deck
    Card.all.each do |card|
      @game.cards << card
    end
  end
end