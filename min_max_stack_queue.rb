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
  attr_reader :max, :min
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
    arg_h = { value: arg, old_max: @max, old_min: @min }
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

end

class StackQueue
  attr_reader :store
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

  def max
    @store.max
  end

  def min
    @store.min
  end
end
