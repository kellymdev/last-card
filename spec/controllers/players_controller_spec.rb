require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let!(:game) { CreateGame.new.call }

  describe "get #new" do
    subject { get :new, game_id: game.id }

    it { is_expected.to render_template :new }
  end

  describe "post #create" do
    context "with a valid name" do
      it "redirects to the show game page" do
        post :create, game_id: game.id, player: { name: "Sally" }
        expect(response).to redirect_to game
      end

      it "creates a new player" do
        expect { post :create, game_id: game.id, player: { name: "Jess" } }
          .to change { Player.count }.by 1
      end
    end

    context "with an invalid name" do
      subject { post :create, game_id: game.id, player: { name: "Test123" } }

      it { is_expected.to render_template :new }
    end
  end
end
