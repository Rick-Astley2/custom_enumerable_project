module Enumerable
  def my_map
    return to_enum(:my_map) unless block_given?
    mapped_array = []
    self.my_each { |element| mapped_array << yield(element)}
    return mapped_array
  end

  def my_none
    return to_enum(:my_none) unless block_given?
    self.my_each { |element|}
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    self.my_each { |element| return false unless yield(element) }
    true
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    self.my_each { |element| return false if yield(element) }
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    self.my_each { |element| return true if yield(element) }
    false
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    self.my_each do |element| 
      yield(element, index)

      index += 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return to_enum(:my_each) unless block_given?
    for element in self
      yield(element)
    end
  end
end

