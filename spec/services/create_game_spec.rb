require 'rails_helper'

RSpec.describe CreateGame, type: :service do
  describe "#call" do
    subject(:game) { CreateGame.new.call }

    context "game creation" do
      it { is_expected.to be_valid }
    end
  end
end