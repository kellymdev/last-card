class TurnsController < ApplicationController
  def create
    ValidateTurn.new.call(suit, value)
    render json: { test: "test" }
  end
end