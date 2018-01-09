require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  list = []
  queue = []
  at_least_one = false
  until vertices.length < 1 || at_least_one
    p vertices.length
    at_least_one = true
    vertices.each do |vertex|
      if vertex.in_edges.empty?
        queue << vertex
        vertices.delete(vertex)
        at_least_one = false
      end
    end
    until queue.empty?
      node = queue.shift
      if list.include?(node)
        return []
      else
        list << node
        node.out_edges.each { |edge| edge.destroy! }
      end
    end
  end
  list
end
