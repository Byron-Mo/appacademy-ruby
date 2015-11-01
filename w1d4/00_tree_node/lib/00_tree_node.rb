class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child)
    raise "Bad parent" unless child.parent == self
    child.parent = nil
  end

  def parent=(parent)
    @parent.children.delete(self) unless @parent.nil?
    if parent == nil
      @parent = nil
    elsif !parent.nil?
      parent.children << self
      @parent = parent
    end
  end

  def dfs(target_value)
    return self if target_value == @value
    return nil if @children.empty?
    @children.each do |child|
      possible_node = child.dfs(target_value)
      return possible_node unless possible_node.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      if queue[0].value == target_value
        return queue[0]
      else
        queue += queue[0].children
        queue.shift
      end
    end
    nil
  end
end
