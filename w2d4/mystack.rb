class MyStack
  def initialize
    @store = []
  end

  def self.pop
    @store.pop
  end

  def push(num)
    @store.push(num)
  end

  def peek
    @store[-1]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty
  end

  def max
    min = self.pop
    max = min


    max_value = nil
    while @store.size > 0

    end
  end
end
