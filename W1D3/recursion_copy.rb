def range(start, finish)
  return [] if finish <= start
  # return [start] if start == finish
  [start].concat(range(start + 1, finish))
end

def sum(arr)
  return arr.first if arr.length == 1
  arr.first + sum(arr[1..-1])
end

def exp(base, power)
  return 1 if power == 0
  base * exp(base, power - 1)
end

def exp2(base, power)
  return 1 if power == 0
  return exp2(base, power / 2)**2 if power.even?
  base * (exp2(base, (power - 1) / 2)**2)
end

class Array

  def deep_dup
    dupped = []
    self.each do |el|
      if el.is_a? Array
        dupped << el.deep_dup
      else
        dupped << el
      end
    end
    dupped
  end

end

def fibonacci(num)
  return [0] if num == 1
  return [0, 1] if num == 2

  result = fibonacci(num - 1)
  result << result[-1] + result[-2]
  result

end

require 'byebug'
def subsets(array)
  return [[]] if array.empty?
  last = array[-1]
  one_less = subsets(array[0..-2])

  one_less + one_less.map { |subs| subs += [last] }

end

def bsearch(array, target)
  if array.length == 1
    return 0 if array[0] == target
    return nil
  end
  mid = array.length / 2

  case array[mid] <=> target
  when 0
    return mid
  when 1
    return bsearch(array.take(mid), target)
  when -1
    search = bsearch(array.drop(mid), target)
    return search + mid if search
  end
end

def merge_sort(array)
  return [] if array.empty?
  return array if array.length == 1

  mid = array.length / 2

  sorted_left = merge_sort(array.take(mid))
  sorted_right = merge_sort(array.drop(mid))

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    case left.first <=> right.first
    when -1, 0
      sorted << left.shift
    when 1
      sorted << right.shift
    end
  end

  sorted + left + right
end
