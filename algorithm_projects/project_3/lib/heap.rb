
class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new { |x, y| x <=> y }
    @store = []
  end

  def count
    @store.length
  end

  def extract
    extracted = @store[0]
    @store[0] = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    extracted
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1)
  end

  public
  def self.child_indices(len, parent_index)
    first = 2 * parent_index + 1
    second = 2 * parent_index + 2
    if len > second
      [first, second]
    elsif len > first
      [first]
    else
      []
    end
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    sorted = false

    prc = prc || Proc.new { |x, y| x <=> y }

    while sorted == false
      sorted = true

      parent_val = array[parent_idx]
      child_indices = self.child_indices(len, parent_idx)
      if child_indices.length == 1 && child_indices[0] < len
        child_val = array[child_indices[0]]
        child_idx = child_indices[0]
      elsif child_indices.length == 2 && child_indices[1] < len
        child_left = array[child_indices[0]]
        child_right = array[child_indices[1]]

        if prc.call(child_left, child_right) < 0
          child_val = child_left
          child_idx = child_indices[0]
        else
          child_val = child_right
          child_idx = child_indices[1]
        end

      else
        child_val = nil
      end

      if child_val == nil
        break
      elsif prc.call(parent_val, child_val) > 0
        # p prc.call(parent_val, child_val)
        sorted = false
        array[parent_idx] = child_val
        array[child_idx] = parent_val
        parent_idx = child_idx
      else
        # p prc.call(parent_val, child_val)
      end
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    sorted = false

    prc = prc || Proc.new { |x, y| x <=> y }

    while sorted == false && child_idx != 0 && child_idx < len
      sorted = true

      child_val = array[child_idx]
      parent_idx = self.parent_index(child_idx)
      parent_val = array[parent_idx]
      if prc.call(parent_val, child_val) >= 1
        sorted = false
        array[parent_idx] = child_val
        array[child_idx] = parent_val
        child_idx = parent_idx
      end
    end

    array
  end
end
