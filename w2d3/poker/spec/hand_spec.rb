require 'rspec'
require 'hand'

RSpec.describe Hand do

  subject(:hand) { Hand.new }

  describe "#initialize" do
    it "creates an empty array to store the cards" do
      expect(hand.cards).to eq([])
    end
  end

  

end
