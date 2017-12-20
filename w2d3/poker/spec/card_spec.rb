require 'rspec'
require 'card'

RSpec.describe Card do
  subject(:card) { Card.new("A", "Hearts", 1)}
  describe "#initialize" do
    it "has a name" do
      expect(card.name).to eq("A")
    end

    it "has a suit" do
      expect(card.suit).to eq("Hearts")
    end

    it "has a value" do
      expect(card.value).to eq(1)
    end

    it "is flipped face down" do
      expect(card.flipped).to be_falsey
    end
  end

  describe "#flip" do
    it "flips the card" do
      card.flip
      expect(card.flipped).to be_truthy
    end
  end


end
