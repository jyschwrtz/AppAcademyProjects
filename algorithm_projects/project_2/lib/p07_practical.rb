require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  map = HashMap.new
  string.chars.each do |letter|
    if map.include?(letter)
      current_val = map.get(letter)
      map.set(letter, current_val + 1)
    else
      map.set(letter, 1)
    end
  end
  odd_letter = false
  map.each do |key, val|
    if val % 2 == 1
      if odd_letter == true
        return false
      else
        odd_letter = true
      end
    end
  end
  true
end
