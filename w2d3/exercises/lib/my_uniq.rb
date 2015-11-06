class Array
  def my_uniq
    uniq_array = []
    self.each do |el|
      uniq_array << el unless uniq_array.include?(el)
    end
    uniq_array
  end
end
