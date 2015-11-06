class StackQueue
  def initialize
    @stack = MyStack.new

  end

  def enqueue(item)
    @stack.push(item)
  end

  def dequeue
    stack2 = MyStack.new

    @stack.size.times{stack2.push(@stack.pop)}
    a = stack2.pop
    stack2.size.times{@stack.push(stack2.pop)}
    a
  end

  def size
    @stack.size
  end

  def empty?
    @stack.empty?
  end
end
