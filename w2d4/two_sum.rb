def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |num1, i|
    arr.drop(i + 1).each do |num2|
      return true if num1 + num2 == target_sum
    end
  end
  return false
end


def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  k1 = 0
  k2 = arr.count - 1
  until k1 == k2
    if arr[k1] + arr[k2] == target_sum
      return true
    elsif arr[k1] + arr[k2] < target_sum
      k1 += 1
    elsif arr[k1] + arr[k2] > target_sum
      k2 -= 1
      k1 = 0
    end
  end
  return false
end

# p okay_two_sum?([0, 1, 5, 7], 6)
# p okay_two_sum?([0, 1, 5, 7], 10)

def pair_sum?(arr, target)
  hash = Hash.new(0)

  # arr.each do |num|
  #   hash[num] = target - num
  # end
  #
  # hash.each do {|k, v| return true if }

  arr.each_with_index do |num, idx|
    hash[idx] = num
  end

  hash.each do |k, v|
    next if k == hash.key(target - v)
    return true if hash.has_value?(target - v)
  end
  return false

end

p pair_sum?([0, 1, 4, 7, 5], 6)
p pair_sum?([0, 1, 5, 7], 6)
p pair_sum?([0, 3, 4, 5, 1], 8)
