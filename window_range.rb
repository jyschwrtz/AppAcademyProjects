require_relative 'min_max_stack_queue.rb'
require 'byebug'

def naive(arr, window)
  subs = arr.each_cons(window)
  current_max_range = 0
  subs.each do |element|
    if current_max_range < element.max - element.min
      current_max_range = element.max - element.min
    end
  end
  current_max_range
end

def windowed_max_range(arr, window)
  queue = StackQueue.new
  # debugger
  max_range = 0
  arr.each do |num|
    queue.enqueue(num)
    if queue.size > window
      queue.dequeue
    end
    if queue.size == window
      range = queue.max - queue.min
      max_range = range if range > max_range
    end
  end
  max_range
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
