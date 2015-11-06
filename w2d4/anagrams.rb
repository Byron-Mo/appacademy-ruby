def first_anagram?(str1, str2)
  letters = str1.split("")
  word_permutations = letters.permutation(letters.count).to_a.map(&:join)

  word_permutations.include?(str2)
end

def second_anagram?(str1, str2)
  str1_arr = str1.split('')
  str2_arr = str2.split('')

  until str2_arr.empty? || str1_arr.empty?
    str1_arr.each_with_index do |letter, idx|
      if letter == str2_arr.first
        str1_arr.delete_at(idx)
        str2_arr.shift
        break
      elsif letter != str2_arr.first && idx == str1_arr.count - 1
        return false
      end
    end
  end

  str1_arr.empty? && str2_arr.empty?
end

def third_anagram?(str1, str2)
  str1_arr = str1.split('').sort
  str2_arr = str2.split('').sort

  str1_arr == str2_arr
end

def fourth_anagram?(str1, str2)
  str1_arr = str1.split('')
  str2_arr = str2.split('')

  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1_arr.each do |letter1|
    hash1[letter1] += 1
  end

  str2_arr.each do |letter2|
    hash2[letter2] += 1
  end
  p hash1
  p hash2
  hash1 == hash2
end

def fifth_anagram?(str1, str2)
  str1_arr = str1.split('')
  str2_arr = str2.split('')

  hash = Hash.new(0)

  str1_arr.each do |letter1|
    hash[letter1] += 1
  end

  str2_arr.each do |letter2|
    hash[letter2] -= 1
  end
  p hash
  hash.values.all?{|num| num == 0}
end

p fifth_anagram?("elvis", "lives")

## Recursion to create permutations
def permute(array)
  return array if array.size <= 1

  result = []

  array.each do |el|
    new_array = array.dup
    new_array.delete(el)
    result += permute(new_array).map do |perm|
      if perm.is_a?(Array)
        [el] + perm
      else
        [el] + [perm]
      end
    end
  end
  result
end
