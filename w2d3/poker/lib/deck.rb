require_relative 'card'
require_relative 'player'

class Deck
  attr_reader :cards
  def initialize
    @cards = create_deck.shuffle
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def deal(player)
    player.hand << @cards.pop
  end

  def count
    @cards.length
  end

  private

  def create_deck
    stack_of_cards = []
    suits = %w(Hearts Spades Diamonds Clubs)
    names = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    suits.each do |suit|
      names.each.with_index do |name, i|
        stack_of_cards << Card.new(name, suit, i + 1)
      end
    end
    stack_of_cards
  end


  # def create_deck
  #   stack_of_cards = []
  #   ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
  #   suits = %w{Spades Hearts Diamonds Clubs}
  #   suits.each do |suit|
  #     ranks.size.times do |i|
  #       stack_of_cards << Card.new( ranks[i], suit, i+1 )
  #     end
  #   end
  #   stack_of_cards
  # end

end
