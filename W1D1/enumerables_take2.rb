require 'byebug'

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |el|
      result << el unless prc.call(el)
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    result = []
    self.each do |el|
      if el.is_a? Array
        result += el.my_flatten
      else
        result << el
      end
    end
    result
  end

  def my_zip(*args)
    result = []
    self.each_index do |i|
      result << []
      result[i] << self[i]
      args.each do |array|
        result[i] << array[i]
      end
    end
    result
  end

  def my_rotate(num = 1)
    if num > 0
      num = num % self.length
    elsif num < 0
      num = num + self.length
    else
      return self
    end
    # debugger
    arr = self.dup
    num.times do
      first = arr.shift
      arr.push(first)
    end
    arr
  end

  def my_join(sep = "")
    str = ""
    self.length.times do |i|
      str << self[i]
      str << sep unless i == self.length - 1
    end
    str
  end

  def my_reverse
    return self if self.length == 1
    result = []

    self.length.times do |i|
      result << self[-(i + 1)]
    end
    result
  end

end
