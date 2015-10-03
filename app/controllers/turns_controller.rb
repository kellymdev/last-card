class TurnsController < ApplicationController
  def create
    render json: { test: "test" }
  end
end