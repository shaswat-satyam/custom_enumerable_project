module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield(i)  
    end
    self
  end

  def my_each_with_index
    array = self
    length = 0
    for i in array do
      yield(i,length)
      length  += 1
    end
    self
  end

  def my_select(&block)
    array = self
    result = []
    for i in array do
      if block.call(i)
        result << i 
      end
    end
    result
  end

  def my_all?(&block)
    array = self
    for i in array do
      if block.call(i) == false
        return false
      end
    end
    return true
  end

  def my_any?(&block)
    array = self
    for i in array do
      if block.call(i) == true
        return true
      end
    end
    return false
  end

  def my_none?(&block)
    array = self
    for i in array do
      if block.call(i) == true
        return false
      end
    end
    return true
  end

  def my_count(&block)
    array = self
    count = 0
    if block_given?
      for i in array do
        if block.call(i) == true
          count += 1
        end
      end
      count
    else 
      array.length
    end
  end

  def my_map(&block)
    array = self
    result = []
    for i in array do
      result << block.call(i)
    end
    result
  end
    
  def my_inject(value,&block)
    array = self
    result = value
    for i in array
      result = block.call(result,i)
    end
    result
  end
end
