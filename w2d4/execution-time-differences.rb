def my_min1(array)
  array.each do |num1|
    array.each do |num2|
      break if num1 > num2
      return num1 if num2 == array.last
    end
  end
end

# 2n^2
# O(n^2)

def my_min2(array)
  smallest_num = nil
  array.each do |num|
    if smallest_num.nil? || smallest_num > num
      smallest_num = num
    end
  end
  smallest_num
end

# n + 2
# O(n)

# a = [ 0, 3, 5, 4, -5, 10, 1, 90, -5 ]
# p my_min2(a)

def largest_contiguous_subsum1(list)
  p Time.now
  sub_arrays = []
  list.each_index do |i|
    list.each_index do |j|
      next if j < i
      sub_arrays << list[i..j]
    end
  end
  sub_arrays.map{|numbers| numbers.inject(:+)}.max
  p Time.now
end

# 3n^2 + n + 1
# O(n^2)

def largest_contiguous_subsum2(array)
  # return [list[0]] if list.count == 1
  #
  # start_num = list.shift
  # large_sum = start_num
  #
  # other_list = list.dup
  #
  # idx = 0
  # while idx < list.count
  #   sum = list[0..idx].inject(:+)
  #   if large_sum < start_num + sum
  #     large_sum = start_num + sum
  #   end
  #   idx += 1
  # end
  #
  # [large_sum] + largest_contiguous_subsum2(other_list)

  largest = nil
  current = 0

  array.each do |el|
    current += el
    if largest.nil? || current > largest
      largest = current
    end
    current = 0 if current < 0
  end

  largest

end
list = [-5, -3, -7, -8]
p largest_contiguous_subsum2(list)
