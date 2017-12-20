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
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(arg)
    @in_stack.push(arg)
  end

  def dequeue
    if @out_stack.empty?
      @out_stack.push(@in_stack.pop[:value]) until @in_stack.empty?
    end
    @out_stack.pop[:value]
  end

  def size
    @out_stack.size + @in_stack.size

  end

  def empty?
    @out_stack.empty? && @in_stack.empty?
  end

  def max
    maxes = []
    maxes << @out_stack.max unless @out_stack.empty?
    maxes << @in_stack.max unless @in_stack.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @out_stack.min unless @out_stack.empty?
    mins << @in_stack.min unless @in_stack.empty?
    mins.min
  end
end
