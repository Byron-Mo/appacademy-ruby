require 'byebug'

def range(starting, ending)
  arr =[]
  return arr if ending < starting
  if starting == ending
    arr << starting
  else
    arr = [starting] + range(starting + 1, ending)
  end
end

def sum_iter(arr)
  sum = 0
  arr.each do |el|
    sum += el
  end
  sum
end

def sum_recur(arr)
  return 0 if arr.empty?
  arr.pop + sum_recur(arr)
end

# $frames = 0
def exp1(b, n)
  return 1 if n == 0
  b * exp1(b, n - 1)
end

def exp2(b, n)
  # $frames += 1
  case
  when n == 0
    return 1
  when n == 1
    return b
  when n.even?
    even_n  = exp2(b, n/2)
    even_n * even_n
  when n.odd?
    odd_n = exp2(b, (n-1)/2)
    b * odd_n * odd_n
  end
  # $frames
end

def deep_dup(arr)
  new_arr = []
  arr.each do |el|
    if el.is_a?(Array)
      new_arr << deep_dup(el)
    else
      new_arr << el
    end
  end
  new_arr
end

def fibs(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  fibs(n-1) << fibs(n-2).pop + fibs(n-1).pop
end

def bsearch(array, target)
  counter = 0

  left =  array[0...(array.size / 2)]
  right = array[(array.size / 2)...array.size]

  if array.size == 1
    return array[0] != target ? nil : counter
  elsif left.last >= target
    bsearch(left, target)
  else
    index = bsearch(right, target)
    index.nil? ? nil : counter = left.size + index
  end
end


def dumb_change(amt, change = [25, 10, 5, 1])
debugger
  coins = []
  return [] if amt == 0
  i = 0
  change.each do |coin|
    if amt - coin < 0
      i = change.index(coin) + 1
      next
    else
      return [coin] + dumb_change(amt - coin, change[i...change.size])
    end
  end
  coins
end

def make_change(amt, coins = [25, 10, 5, 1])
  return [] if amt == 0
  best_change = nil
  coins.each_with_index do |coin, idx|
    if coin > amt
      next
    end
    remainder = target - coin
    best_remainder = make_change(remainder, coins.drop(index))

    if best_remainder.nil?
      next
    end

    this_change = [coin] + best_remainder

    if best_change.nil? || this_change.count < best_change.count
      best_change = this_change
    end
  end
  best_change
end
