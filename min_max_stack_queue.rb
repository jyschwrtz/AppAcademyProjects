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
    if arg_h[:value] == @max && arg_h[:value] == @min
      @max = arg_h[:max]
      @min = arg_h[:min]
    elsif arg_h[:value] == @max
      @max = arg_h[:max]
    elsif arg_h[:value] == @min
      @min = arg_h[:min]
    end

    arg_h
  end

  def push(arg)
    arg_h = { value: arg, max: @max, min: @min }
    @store.push(arg_h)
    @max ||= arg
    @min ||= arg
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
  attr_reader :store, :temp
  def initialize
    @temp = MyStack.new
    @store = MyStack.new
  end

  def enqueue(arg)
    @temp.push(arg)
  end

  def dequeue
    if @store.empty?
      @store.push(@temp.pop[:value]) until @temp.empty?
    end
    @store.pop
  end

  def size
    @store.size + @temp.size

  end

  def empty?
    @store.empty? && @temp.empty?
  end

  def max
    maxes = []
    maxes << @store.max unless @store.empty?
    maxes << @temp.max unless @temp.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @store.min unless @store.empty?
    mins << @temp.min unless @temp.empty?
    mins.max
  end
end
