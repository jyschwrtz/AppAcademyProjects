require 'rspec'
require 'towers_of_hanoi'

RSpec.describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new }

  describe "#initialize" do
    it "initializes a board with 3 rings on the first peg" do
      expect(towers.board).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#move" do
    context "when move positions are invalid"

    it "prevents moving a larger disk onto a smaller disk" do
      towers.move(0, 1)
      towers.move(0, 1)
      expect(towers.board).to eq([[3, 2], [1], []])
    end

      it "raises an ArgumentError for three positions" do
        expect { towers.move(0, 1, 4) }.to raise_error(ArgumentError)
      end

    it "modifies the board based on user input" do
      towers.move(0,1)
      expect(towers.board).to eq([[3, 2], [1], []])
    end
  end

  describe "#won?" do
    it "returns true when second or third peg has correct sequence of rings" do
      solved_towers = TowersOfHanoi.new([[], [3, 2, 1], []])
      expect(solved_towers.won?).to be_truthy
    end

    it "returns false when first peg has any rings" do
      expect(towers.won?).to be_falsey
    end
  end

end
