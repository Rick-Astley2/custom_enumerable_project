module Enumerable
  def my_map
    return self.to_enum unless block_given?
    mapped_array = []
    self.my_each { |element| mapped_array << yield(element)}
    return mapped_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return self.to_enum unless block_given?
    for element in self
      yield(element)
    end
  end
end

