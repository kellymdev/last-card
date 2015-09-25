require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "validations" do
    let(:name) { "Fabulous Feline" }

    subject(:player) { Player.new(name: name) }

    context "with a valid name" do
      it { is_expected.to be_valid }
    end

    context "with an invalid name" do
      let(:name) { "Test 123" }

      it { is_expected.to_not be_valid }
    end
  end
end
