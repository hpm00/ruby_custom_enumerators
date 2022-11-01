module Enumerable
  # Your code goes here
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

  def my_inject
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    return self unless block_given?
    for item in self do
      yield item
    end
    self 
  end

end
