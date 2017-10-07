require 'byebug'

class Array
  # calls my_each twice on the array, printing all the numbers twice.
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    ret_array = []
    self.my_each { |el| ret_array << el if prc.call(el) }
    ret_array
  end

  def my_reject(&prc)
    ret_array = []
    self.my_each { |el| ret_array << el if !prc.call(el) }
    ret_array
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    false
  end

  def my_flatten(arr = [])
    ret_array = arr
    self.my_each do |el|
      if el.is_a?(Array)
        ret_array = el.my_flatten(ret_array)
      else
        ret_array << el
      end
    end
    ret_array
  end

  def my_zip(*args)
    ret_array = []
    # take each element of self in order
    # add to that, that index of additional args passed in, if nothing, nil
    self.each_with_index do |el, idx|
      sub_array = []
      sub_array << el
      args.each do |array|
        sub_array << array[idx]
      end
      ret_array << sub_array
    end
    ret_array
  end

  def my_rotate(shift = 1)
    ret_array = []
    self.each.with_index do |el, idx|
      act_shift = (idx + shift) % self.length
      ret_array << self[act_shift]
    end
    ret_array
  end

  def my_join(separator = "")
    ret_string = ""
    self.each_with_index do |el, idx|
      ret_string << el
      ret_string << separator unless idx == self.length - 1
    end
    ret_string
  end

  def my_reverse
    index = self.length - 1
    ret_array = []
    while index >= 0
      ret_array << self[index]
      index -= 1
    end
    ret_array
  end

end



if __FILE__ == $PROGRAM_NAME
end
