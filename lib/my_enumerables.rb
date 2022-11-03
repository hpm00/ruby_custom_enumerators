module Enumerable

  def my_each_with_index
    return self unless block_given?
    i = 0 
    for item in self do 
      yield(item, i)
      i += 1
    end
    self
  end

  def my_select
    result = []
    self.my_each { |item| result << item if yield(item) }
    result
  end 

  def my_all?
    result = []
    self.my_each { |item| result << item if yield(item) }
    result == self
  end

  def my_any?
    self.my_each { |item| return true if yield(item) }
    false
  end 

  def my_none?
    self.my_each { |item| return false if yield(item) }
    true
  end

  def my_count
    return self.length if !block_given?
    result = []
    self.my_each { |item| result << item if yield(item) }
    result.length
  end 

  def my_map
    result = []
    self.my_each { |item| result << yield(item) }
    result
  end 

  def my_inject(initial_value)
    accumulator = initial_value
    self.my_each { |item| accumulator = yield(accumulator, item)  }
    accumulator
  end

end

# if two parameters in block, yield must consist of 2 parameters as well
# look at my_each_with_index_spec.rb & my_inject_spec.rb (both has 2 parameters)
# rest has 1 parameter
# yield(parameter) => result of executing the block with given parameter

class Array

  def my_each
    return self unless block_given?
    for item in self do
      yield item
    end
    self 
  end

end
