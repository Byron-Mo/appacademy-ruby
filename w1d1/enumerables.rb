require 'byebug'

class Array
  def my_each(&blk)
    i = 0
    while i < self.size
      blk.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&blk)
    arr = []
    self.my_each do |el|
      arr << el if blk.call(el)
    end
    arr
  end

  def my_reject(&blk)
    arr = []
    self.my_each do |el|
      arr << el if blk.call(el) == false
    end
    arr
  end

  def my_any?(&blk)
    self.my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  def my_all?(&blk)
    self.my_each do |el|
      return false unless blk.call(el)
    end
    true
  end

  def my_flatten
    arr = []
    self.my_each do |el|
      el.class == Array ? arr += el.my_flatten : arr << el
    end
    arr
  end


  def my_zip(*args)
    arr = Array.new(self.size) { Array.new(args.size + 1) }

    self.each_with_index do |el, idx|
      arr[idx][0] = el
    end

    #empty = args[1][1]
    col = 0
    while col < arr.size
      row = 0
      while row < args.size
        arr[col][row + 1] = args[row][col]
        row += 1
      end
      col += 1
    end
    arr

  end

  def my_rotate(rotations = 1)
    new_size = self[0..(rotations % self.size) - 1].size
    self[new_size..-1] + self[0..new_size - 1]
  end

  def my_join(arg = "")
    string = ""
    self.each_with_index do |el, idx|
      if idx == self.size - 1
        string << el
      else
        string << el + arg
      end
    end
    string
  end

  def my_reverse
    rev_arr =[]
    i = self.size - 1
    while i >= 0
      rev_arr << self[i]
      i -= 1
    end
    rev_arr
  end

end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
