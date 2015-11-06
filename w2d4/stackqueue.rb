require_relative 'mystack'

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(item)
    @in_stack.push(item)
  end

  def dequeue
    if @out_stack.empty?
      @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end

    @out_stack.pop
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def max
    maxes = []
    maxes << @in_stack.max unless @in_stack.empty?
    maxes << @out_stack.max unless @out_stack.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @in_stack.min unless @in_stack.empty?
    mins << @out_stack.min unless @out_stack.empty?
    mins.min
  end
end
