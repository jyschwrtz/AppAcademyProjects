require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  in_edges = {}
  queue = []
  order = []

  vertices.each do |vert|
    in_edge_count = vert.in_edges.reduce(0){ |accum, edge| accum += edge.cost }
    in_edges[vert] = in_edge_count
    queue << vert if in_edge_count == 0
  end

  until queue.empty?
    vertex = queue.shift

    vertex.out_edges.each do |edge|
      new_vertex = edge.to_vertex
      in_edges[new_vertex] -= edge.cost
      queue << new_vertex if in_edges[new_vertex] == 0
    end

    order << vertex
  end

  vertices.length == order.length ? order : []
end
