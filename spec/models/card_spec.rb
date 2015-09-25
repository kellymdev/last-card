require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "validations" do
    let(:value) { "3" }
    let(:suit) { "hearts" }
    let(:points) { 3 }

    subject(:card) { Card.new(value: value, suit: suit, points: points) }

    context "with valid values for value, suit and points" do
      it { is_expected.to be_valid }
    end

    context "with valid values for an 8 card" do
      let(:value) { "8" }
      let(:points) { 50 }

      it { is_expected.to be_valid }
    end

    context "with an invalid value" do
      let(:value) { "11" }

      it { is_expected.to_not be_valid }
    end

    context "with an invalid suit" do
      let(:suit) { "stars" }

      it { is_expected.to_not be_valid }
    end

    context "with invalid points" do
      let(:points) { 11 }

      it { is_expected.to_not be_valid }
    end
  end
end
