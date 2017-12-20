require 'rspec'
require 'array_tdd'

# Needs to remove elements from the array
# Should have the same elements as array.uniq

RSpec.describe Array do
  # subject(:my_array) { [1, 2, 3, 4, 4] }
  describe "#remove_dups" do
    subject(:my_array) { [1, 2, 3, 4, 4] }
    it "returns an empty array for an empty array" do
      my_empty_array = []
      expect(my_empty_array.remove_dups).to be_empty
    end

    it "removes duplicate elements from an array" do
      expect(my_array.remove_dups).to eq([1, 2, 3, 4])
    end
  end

  describe "#two_sums" do
    subject(:my_array) { [0, 0, 1, -1] }
    it "returns an empty array for an empty array" do
      my_empty_array = []
      expect(my_empty_array.two_sums).to be_empty
    end

    it "returns array of positions that sum to 0" do
      expect(my_array.two_sums).to eq([[0, 1], [2, 3]])
    end
  end

  describe "#my_transpose" do
    subject(:my_array) { [[0, 0], [1, 1]] }
    it "returns an empty array for an empty array" do
      my_empty_array = []
      expect(my_empty_array.my_transpose).to be_empty
    end

    it "raises an error if it receives a 1-D array" do
      my_1d_array = [1, 2, 3]
      expect {my_1d_array.my_transpose}.to raise_error(TypeError)
    end

    it "transposes a 2-D array" do
      expect(my_array.my_transpose).to eq([[0, 1], [0, 1]])
    end
  end

  describe "#stock_picker" do
    subject(:my_stocks) { [1, 2, 3, 4, 5, 1, 5] }
    it "returns empty array for an empty array" do
      my_empty_array = []
      expect(my_empty_array.stock_picker).to be_empty
    end

    it "returns largest consecutive range where buy date precedes sell date" do
      expect(my_stocks.stock_picker).to eq([0, 4])
    end

    it "returns empty array for continuosly descending stock" do
      my_bad_stocks = [4, 3, 2, 1, 0]
      expect(my_bad_stocks.stock_picker).to be_empty
    end

  end


end
