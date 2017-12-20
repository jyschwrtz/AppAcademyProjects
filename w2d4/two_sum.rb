
#Time = O(n^2)
#Space = O(1)
def two_sum?(arr, target_sum)
  i = 0

  while i < arr.length
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target_sum
      j += 1
    end
    i += 1
  end
  false
end

#Time = O(nlog(n))
#Space = O(n)
def okay_two_sum?(arr, target_sum)
  i = 0
  j = -1
  arr = arr.sort

  while i < arr.length - 1
    if i == arr.length + j
      i += 1
      j = -1
    end

    case arr[i] + arr[j] <=> target_sum
    when -1
      j = -1
      i += 1
    when 0
      return true
    when 1
      j -= 1
    end
  end
  false
end

#Time = O(n)
#Space = O(n)
def two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each do |num|
    hash[num] += 1
  end

  arr.each do |num|
    temp = target_sum - num
    next if num == temp && hash[temp] < 2
    return true if hash[temp] > 0
  end
  false
end



arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 12)
p two_sum?(arr, 12)
p two_sum?(arr, 10)
