class GamesController < ApplicationController
  def show
    find_game
  end

  def new
    @game = Game.new
  end

  def create
    @game = CreateGame.new.call
    redirect_to @game
  end

  def deal
    find_game
    DealDeck.new.call(@game)

    redirect_to @game
  end

  private

  def find_game
    @game ||= Game.find(params[:id])
  end
end