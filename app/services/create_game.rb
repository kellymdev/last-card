class CreateGame
  def call
    @game = Game.new
    create_deck
    create_computer_player
    @game if @game.save!
  end

  private

  def create_deck
    Card.all.each { |card| @game.cards << card }
  end

  def create_computer_player
    names = %w(Bella Dave Jackie Sam Stephanie Steve)
    @game.players << Player.new(name: names.sample, is_computer: true)
  end
end