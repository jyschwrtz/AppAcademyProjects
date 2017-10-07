require 'set'

class WordChainer
  attr_accessor :current_words, :all_seen_words
  attr_reader :dictionary

  def initialize(dictionary_file_name="dictionary.txt")
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp).to_set

  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]

    until @current_words.empty?
      new_current_words = @current_words.select do |word|
        adjacent_word(word)
      end
    end


  end

  def adjacent_word(word)
    result = dictionary.select do |el|
      el.length == word.length && near_match?(word, el)

    end
    p result
  end

  def near_match?(word1, word2)
    count = 0
    letter_count = word1.length
    return false if word1 == word2
    letter_count.times do |i|
      count += 1 unless word1[i] == word2[i]
      return false if count > 1
    end
    true
  end

end
