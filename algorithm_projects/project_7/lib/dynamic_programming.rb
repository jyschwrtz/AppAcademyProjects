class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2};
    @frog_cache = { 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]

    ans = blair_nums(n - 1) + blair_nums(n - 2) + n * 2 - 3
    @blair_cache[n] = ans
    ans
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    # @frog_cache = { 1 => 1, 2 => 2, 3 => 4 }
    @frog_cache = { 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
    (4..n).each do |num|
      @frog_cache[num] = @frog_cache[num - 1].map { |arr| arr.dup << 1 } +
                        @frog_cache[num - 2].map { |arr| arr.dup << 2 } +
                        @frog_cache[num - 3].map { |arr| arr.dup << 3 }
    end
    @frog_cache
  end

  def frog_hops_top_down(n)
    return @frog_cache[n] if @frog_cache[n]

    ans = frog_hops_top_down_helper(n)
    @frog_cache[n] = ans
    ans
  end

  def frog_hops_top_down_helper(n)
    frog_hops_top_down(n - 1).map { |arr| arr.dup << 1 } +
      frog_hops_top_down(n - 2).map { |arr| arr.dup << 2 } +
      frog_hops_top_down(n - 3).map { |arr| arr.dup << 3 }
  end

  def super_frog_hops(n, k)
    super_frog_cache_builder(n, k)[n]
  end

  def super_frog_cache_builder(n, k)
    @super_frog = { 1 => [[1]] }
    (2..k).each do |num|
      temp = []
      (num - 1).times do |j|
        temp[j] = @super_frog[num - j - 1].map { |arr| arr.dup << (j + 1)}
      end
      @super_frog[num] = temp.reduce(&:+).concat([[num]])
    end

    ((k + 1)..n).each do |num|
      temp = []
      k.times do |j|
        temp[j] = @super_frog[num - (j + 1)].map { |arr| arr.dup << (j + 1) }
      end
      @super_frog[num] = temp.reduce(&:+)
    end
    @super_frog
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
