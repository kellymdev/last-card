class GamesController < ApplicationController
  def show
    find_game
    find_player
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
    @game ||= GamePresenter.new(Game.find(params[:id]))
  end

  def find_player
    @player = @game.players.where(is_computer: false).first
  end
end
