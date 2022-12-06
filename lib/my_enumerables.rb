module Enumerable
  # Your code goes here
  def my_each_with_index
    return self.to_enum unless block_given?

    index = 0
    self.my_each do |i|
      yield(i, index)
      index += 1
    end
  end

  def my_select
    return self.to_enum unless block_given?

    selected = []
    self.my_each { |i| selected << i if yield i }
    selected
  end

  def my_all?
    self.my_each { |i| return false unless yield i }
    true
  end

  def my_any?
    self.my_each { |i| return true if yield i }
    false
  end

  def my_none?
    self.my_each { |i| return false if yield i }
    true
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each { |i| count += 1 if yield i }
    count
  end

  def my_map
    map = []
    self.my_each do |i| 
      new_i = yield i
      map << new_i
    end
    map
  end

  def my_inject(initial)
    sum = initial
    self.my_each do |i|
      sum = yield sum, i
    end
    sum
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    return self.to_enum unless block_given?
    
    for i in self
      yield i
    end
  end
end
