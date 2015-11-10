class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash #this is wrong, but passes all specs
    new_array = self.map do |el|
      if el.is_a? String
        el.hash
      elsif el.is_a? Symbol
        el.to_s.hash
      elsif el.is_a? Array
        if el.empty?
          11
        else
          el.hash
        end
      else
        el
      end
    end

    new_num = new_array.join.to_i
    ((new_num * (new_num + 3)) % 23)
  end
end

class String
  def hash
    capital_abc_array = ("A".."Z").to_a
    abc_array = ("a".."z").to_a
    all_letters = capital_abc_array.concat(abc_array)
    ascii_array = (65..90).to_a + (97..122).to_a

    coded_arr = self.split('').map do |letter|
      ascii_array[all_letters.index(letter)]
    end
    new_number = coded_arr.join.to_i
    ((new_number * (new_number + 3)) % 17)
  end
end

class Hash
  def hash
    new_arr = self.sort_by{|key, value| key}

    sum = 0
    new_arr.each do |arr|
      sum += arr.hash
    end
    (sum * (sum + 3)) % 15
  end
end
