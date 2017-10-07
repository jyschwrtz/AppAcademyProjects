
def range(start, finish)
  if start == finish - 1
    return [start]
  end

 [start] + range(start + 1, finish)

end



def recursion1(b, n)
  return nil if n < 0

  return b if n == 1

  return 1 if n == 0

  b * recursion1(b, n - 1)
end



def recursion2(b, n)
  return nil if n < 0

  return b if n == 1

  return 1 if n == 0

  if n.even?
    recursion2(b, n / 2 ) ** 2
  else
    b * recursion2(b, (n - 1) / 2 ) ** 2
  end

end



class Array

  def deep_dup
    array = []

    return nil if self.empty?

    self.each do |el|
      if el.is_a? Array
        array << el.deep_dup
      else
        array << el
      end
    end
    array
  end

end

def fib(n)

  return result = [1] if n == 0
  return result = [1, 1] if n == 1

  # fib(n - 1) + fib(n - 2)

  result = [fib(n - 1).last + fib(n - 2).last]
  fib(n - 1) + result
end

def subsets(array)
  if array.length == 1
    return [[], array]
  end

  recursion_var = subsets(array[0..-2])

  map = recursion_var.map{ |el| el.dup << array.last }

  recursion_var + map
end

def permutations(array)
  return [array] if array.length == 1
  results = []

  array.each_index do |idx|
    split_arr = array[0...idx] + array[(idx + 1)..-1]
    recursion_var = permutations(split_arr)

    chunk = []
    recursion_var.each do |el|
      # debugger
      chunk << el.unshift(array[idx])
    end

    results += chunk

  end

  results
end

# p permutations([1,2,3])]]\


def bsearch(array, target)

  middle_idx = array.length / 2

  return nil if array.length == 1 && array[0] != target
  # debugger
  if array[middle_idx] == target
    return middle_idx
  elsif target < array[middle_idx]
    bsearch(array[0...middle_idx], target)
  else
    check = bsearch(array[(middle_idx)..-1], target)
    return nil unless check
    check + middle_idx
  end
end

def merge_sort(array)
  return array if array.length == 1

  middle_idx = array.length / 2

  first = array[0...middle_idx]
  second = array[middle_idx..-1]

  merge(merge_sort(first), merge_sort(second))
end

def merge(array1, array2)
  result = []

  until array1.length == 0 || array2.length == 0
    if array1.first < array2.first
      result << array1.shift
    elsif array2.first < array1.first
      result << array2.shift
    end
  end
  result += array1 + array2
end

def greedy_make_change(target, denominations)
  result = []

  return [] if target == 0

  #normalize denominations
  denominations.sort!
               .reverse!

  # debugger
  minus_target_arr = []
  denominations.each do |coin|
    number_coin = target / coin
    if number_coin > 0

      number_coin.times { result << coin }
      target = target % coin
      minus_target_arr = greedy_make_change(target, denominations)
      target -= minus_target_arr.reduce(:+) if minus_target_arr.length > 0
      result += minus_target_arr
    end
  end
    return result
end

def make_better_change(target, denominations)
  result = []
  return nil if target < 0
  return  [] if target == 0

  #normalize denominations
  denominations.sort!
               .reverse!

  denominations.each do |coin|
    remaining_coins = denominations.select { |el| el <= coin }

    take_option = make_better_change((target - coin), remaining_coins)

    result << ([coin] + take_option) if take_option
    # debugger
    # leave_option = make_better_change(target, remaining_coins)
    #
    # result += leave_option if leave_option
  end

   result.sort_by { |arr| arr.length }
         .first
end

p make_better_change(24, [10, 7, 1])
