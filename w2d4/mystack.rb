class MyStack
  def initialize
    @store = []
    @min_stack = []
    @max_stack = []
  end

  def pop
    @store.pop
  end

  def push(num)
    @store.push(num)
    add_min(num)
    add_max(num)
  end

  def peek
    @store[-1]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @max_stack[-1] unless @max_stack.empty?
  end

  def min
    @min_stack[-1] unless @min_stack.empty?
  end

  def add_min(value)
    if @min_stack.empty? || min > value
      @min_stack.push(value)
    elsif min < value
      @min_stack.push(min)
    end
  end

  def add_max(value)
    if @max_stack.empty? || max < value
      @max_stack.push(value)
    elsif max > value
      @max_stack.push(max)
    end
  end
end
