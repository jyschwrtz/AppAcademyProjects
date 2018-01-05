require_relative "heap"

# [ [1, 2, 3], [2, 5, 9], [4, 6, 7] ]

def files_500(files)
  prc = Proc.new { |x, y| x[0] <=> y[0] }
  heap = BinaryMinHeap.new()
  result = []

  files.length.time do |i|
    heap.push([files[i][0], i, 0])
  end

  while heap.count > 0
    min = heap.extract
    result << min[0]

    next_arr_i = min[1]
    next_idx = min[2] + 1
    next_el = files[next_arr_i][next_idx]

    heap.push([next_el, next_arr_i, next_idx]) if next_el
  end
  result
end
