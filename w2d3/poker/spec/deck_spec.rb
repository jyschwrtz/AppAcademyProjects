require 'rspec'
require 'deck'
require 'set'

RSpec.describe Deck do
  subject(:deck) { Deck.new }
  describe "#initalize" do
    it "creates an array of 52 cards" do
      expect(deck.count).to eq(52)
    end

    it "creates an array of unique cards" do
      expect(deck.count).to eq(Set.new(deck.cards).length)
    end
  end

  describe "#shuffle" do
    it "returns an array of shuffled cards" do
      original_cards = deck.cards
      deck.shuffle
      expect(deck.cards).to_not eq(original_cards)
    end
  end

  let(:player1) { double("player1", name: "one", play_hand: false, amount: 0, hand: [])}

  describe "#deal" do
    before(:each) do
      deck.deal(player1)
    end

    it "deals one card from deck" do
      expect(deck.count).to eq(51)
    end

    it "pass one card to a player" do
      expect(player1.hand.length).to eq(1)
    end
  end

end
