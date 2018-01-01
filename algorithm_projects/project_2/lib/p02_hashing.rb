class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each_with_index do |val, idx|
      total += (val * (idx + 1)).hash + 1
    end
    total
  end
end

class String
  def hash
    total = 0
    self.chars.each.with_index do |letter, idx|
      total += (letter.ord * (idx + 1)).hash
    end
    total
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    self.keys.sort.each.with_index do |key, idx|
      total += (key.hash + idx.hash + self[key].hash)
    end
    total
  end
end
