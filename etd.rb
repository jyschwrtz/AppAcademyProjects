list = [ 3, 5, 4, -5, 0, 10, 1, 90 ]
# Complexity = O(n^2)
def my_min(arr)
  min = false
  arr.each_index do |idx1|
    min = true

    arr.each_index do |idx2|
      next if idx1 == idx2
      min = false if arr[idx2] < arr[idx1]
    end
    return arr[idx1] if min == true
  end

end
# Complexity = O(n)
def my_min2(arr)
  value = arr.first
  arr.each_index do |idx1|
    value = arr[idx1] if value > arr[idx1]
  end
  return value
end

list2 = [5, 3, -7]

def largest_contiguous_subsum(list)
  sub_arrays = []
  list.each_index do |idx1|
    list.each_index do |idx2|
      next if idx1 > idx2
        sub_arrays << list[idx1..idx2]
    end
  end

  sub_sums = sub_arrays.map do |element|
    element.reduce(:+)
  end

  sub_sums.sort.last

end

def largest_contiguous_subsum2(list)
  max = list[0]
  curr_sum = list[0]
  i = 1
  while i < list.length
    curr_sum += list[i]
    if curr_sum > max
      max = curr_sum
    elsif curr_sum < 0
      curr_sum = 0
      max = list[i] if list[i] > max
    end
    i += 1
  end
  max
end

list3 = [2, 3, -6, 7, -6, 7]
list4 = [-5, -1, -3ß]
p largest_contiguous_subsum2(list2)
p largest_contiguous_subsum2(list3)
p largest_contiguous_subsum2(list4)
