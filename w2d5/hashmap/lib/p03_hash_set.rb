require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    resize! if @count == num_buckets
    @store[num % num_buckets] << num
    @count += 1
  end

  def include?(key)
    num = key.hash
    @store[num % num_buckets].include?(num)
  end

  def remove(key)
    num = key.hash
    @store[num % num_buckets].delete(num)
  end

  private

  def [](num)
    num = num.hash
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_set = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_set.each{ |el| insert(el) }
  end
end
