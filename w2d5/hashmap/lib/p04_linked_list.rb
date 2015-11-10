class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    node = @head
    until node.next.nil?
      node = node.next
    end
    node
  end

  def empty?

  end

  def get(key)
    node = @head
    until node.key == key || node == last
      node = node.next
    end
    return nil if node.key != key
    node.val
  end

  def include?(key)
    node = @head
    until node.key == key || node == last
      node = node.next
    end
    return false if node.key != key
    true

  end

  def insert(key, val)
    if @head.key.nil?
      @head.key = key
      @head.val = val
    else
      last.next = Link.new(key, val)
    end
  end

  def remove(key)
    if @head.key == key
      @head = @head.next
    else
      removed_node = get(key)
      node= @head
      until node.next == removed_node
        node = node.next
      end
    node.next = removed_node.next
    end
  end

  def each(&block)
    node = @head
    until node == last
      block.call(node)
      node = node.next
    end
    self
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
