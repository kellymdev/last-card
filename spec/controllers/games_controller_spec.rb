require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  render_views

  describe "get #show" do
    let(:game) { CreateGame.new.call }

    subject { get :show, id: game.id }

    it { is_expected.to render_template :show }
  end

  describe "get #new" do
    subject { get :new }

    it { is_expected.to render_template :new }
  end

  describe "post #create" do
    it "redirects to the game" do
      post :create
      game = Game.last
      expect(response).to redirect_to(game)
    end

    it "increases the number of games by 1" do
      expect { post :create }.to change { Game.count }.by 1
    end
  end
end