require_relative '00_tree_node'

class KnightPathFinder
  attr_reader :visited_positions, :parent

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [@start_pos]
    @parent = PolyTreeNode.new(@start_pos)
  end

  def self.valid_moves(pos)
    move_arr = [
      [-2, -1], [-2, 1], [2, -1], [2, 1],
      [-1, -2], [-1, 2], [1, -2], [1, 2]
    ]

    possible_moves = move_arr.map do |coordinates|
      [pos.first + coordinates.first, pos.last + coordinates.last]
    end

    possible_moves.select do |pos|
      pos.first.between?(0,7) && pos.last.between?(0,7)
    end
  end

  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos)
    possible_moves = possible_moves.reject do |pos|
      @visited_positions.include?(pos)
    end

    @visited_positions.concat(possible_moves)
    possible_moves
  end

  def build_move_tree
    queue = [@parent]
    until queue.empty?
      new_move_positions(queue.first.value).each do |pos|
        child = PolyTreeNode.new(pos)
        child.parent= queue.first
        queue << child
      end
      queue.shift
    end
  end

  def find_path(end_pos)
    trace_path_back(@parent.bfs(end_pos))
  end

  def trace_path_back(node)
    # return [@parent.value] if node == @parent
    return [node.value] if node.parent.nil?
    trace_path_back(node.parent) << node.value

    # arr = []
    # arr << node.value
    # arr.concat(trace_path_back(node.parent))

  end

end

kpf = KnightPathFinder.new([5, 5
  ])
kpf.build_move_tree
count = 0
(0..7).each do |i|
  (0..7).each do |j|
    p count
    p kpf.find_path ([i,j]) #unless i == 0 && j == 0
    count += 1
  end
end
puts count
# p kpf.find_path([0,1])





#
# kpf = KnightPathFinder.new([4,4])
# p kpf.visited_positions
# k = kpf.new_move_positions([4,4])
# p k
# p kpf.visited_positions
# p kpf.new_move_positions(k.first)
