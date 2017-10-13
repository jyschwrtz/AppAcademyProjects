def windowed_max_range(arr, window)
  subs = arr.each_cons(window)
  current_max_range = 0
  subs.each do |element|
    if current_max_range < element.max - element.min
      current_max_range = element.max - element.min
    end
  end
  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(arg)
    @store.unshift(arg)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class MyStack
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    arg_h = @store.pop
    if arg_h[:value] == @max
      @max = arg_h[:old_max]
    elsif arg_h[:value] == @min
      @min = arg_h[:old_min]
    end

    arg_h
  end

  def push(arg)
    @max ||= arg
    @min ||= arg
    arg_h = {value: arg, old_max: @max, old_min: @min}
    @store.push(arg_h)
    @max = arg if arg > @max
    @min = arg if arg < @min
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @store
  end

  def min
  end

end

class StackQueue
  def initialize
    @temp = MyStack.new
    @store = MyStack.new
  end

  def enqueue(arg)
    @temp.push(arg)
    @temp.size.times do
      @store.push(@temp.pop)
    end
    @store
  end

  def dequeue
    @store.pop
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end
