require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let(:game) { CreateGame.new.call }

  describe "get #new" do
    subject { get :new, game_id: game.id }

    it { is_expected.to render_template :new }
  end

  describe "post #create" do
    context "with a valid name" do
      subject { post :create, game_id: game.id, player: { name: "Sally" } }

      it { is_expected.to redirect_to game }
    end

    context "with an invalid name" do
      before { post :create, game_id: game.id, player: { name: "Test123" } }

      it { is_expected.to render_template :new }
    end
  end
end