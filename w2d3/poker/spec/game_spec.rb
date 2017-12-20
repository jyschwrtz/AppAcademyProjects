require 'rspec'
require 'game'

RSpec.describe Game do

  let(:mock_players) {
    [double("player1", name: "one", play_hand: false, amount: 0, hand: [], place_bet: {move: "fold", value: 0}),
      double("player2", name: "two", play_hand: false, amount: 50, hand: [], place_bet: {move: "raise", value: 10}),
      double("player3", name: "three", play_hand: false, amount: 5, hand: [], place_bet: {move: "check", value: 10})]}

  let(:deck) { double("deck1", deal: nil)}

  subject(:game) { Game.new(players: mock_players, deck: deck) }

  describe "#initialize" do
    it "initializes an array of players" do
      expect(game.players.length).to eq(3)
    end

    it "initializes a pot of 0" do
      expect(game.pot).to eq(0)
    end

  end

  describe "#run" do
    it "runs 3 rounds for 3 players" do
      expect(mock_players[0]).to receive(:play_hand).exactly(3).times
      expect(mock_players[1]).to receive(:play_hand).exactly(3).times
      expect(mock_players[2]).to receive(:play_hand).exactly(3).times
      game.run
    end

    it "calls #declare_winner" do
      expect(game).to receive(:declare_winner)
      game.run
    end
  end

  describe "#declare_winner" do
    context "when no player has the largest amount" do
      let(:mock_players) {
        [double("player1", name: "one", play_hand: false, amount: 25),
        double("player2", name: "two", play_hand: false, amount: 25),
        double("player3", name: "three", play_hand: false, amount: 17)]}
      it "declares a tie" do
        expect(game.declare_winner).to include("tie")
      end
    end
    context "when there is a winner" do
      let(:mock_players) {
        [double("player1", name: "one", play_hand: false, amount: 26),
        double("player2", name: "two", play_hand: false, amount: 25),
        double("player3", name: "three", play_hand: false, amount: 17)]}
      it "declares a winner" do
        expect(game.declare_winner).to include("win")
        expect(game.declare_winner).to include(mock_players[0].name)
      end
    end
  end

  describe "#deal_hand" do
    it "deals 5 cards to each player" do
      # allow(game.deck).to receive(:deal) { nil }
      expect(game.deck).to receive(:deal).exactly(15).times
      game.deal_hand
    end
  end

  describe "#take_bet" do
    it "adds the player's bet to the pot" do
      game.take_bet(10)
      expect(game.pot).to eq(10)
    end

  end

  describe "#take_all_bets" do

    it "allows all players to bet, raise, or fold" do
      expect(mock_players[0]).to receive(:place_bet)
      expect(mock_players[1]).to receive(:place_bet)
      expect(mock_players[2]).to receive(:place_bet)
      game.take_all_bets
    end

    it "adds all players' bets to the pot" do
      game.take_all_bets
      expect(game.pot).to eq(20)
    end

    it "continues until all players have bet their final raise"

  end

  describe "#display" do
    it "shows all players hands"
  end

end
