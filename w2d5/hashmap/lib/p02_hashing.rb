class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each_with_index do |el, i|
      if el.is_a?(Array)
        total += el.hash
      else
        total += ((i+1) * el).hash
      end
    end
    total
  end
end

class String
  def hash
    total = 0
    alpha_array = ('a'..'z').to_a
    chars.each_with_index do |ch, i|
      index = alpha_array.index(ch.downcase)
      total += (index * (i + 1)).hash
    end
    total
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    hash_arr = self.to_a.map do |sub_arr|
                [sub_arr[0].hash, sub_arr[1].hash]
              end
    hash_arr.sort!
    hash_arr.each_with_index do |sub_arr, i|
      total += (sub_arr[0] + sub_arr[1]) * (i + 1)
    end
    total
  end
end
