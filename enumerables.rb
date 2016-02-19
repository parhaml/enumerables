module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    my_each {|i| yield(i, self.index(i))}
  end

  def my_select
    return self unless block_given?
    out = []
    self.my_each {|i| out << i if yield i}
    out
  end

  def my_all?
    all = true
    self.my_each {|i| all = false if not yield i}
    all
  end

  def my_any?
    any = false
    unless any 
      self.my_each {|i| any = true if yield i}
    end
    any
  end

  def my_none?
    self.my_all?{|i| not yield i}
  end

  def my_count
    count = 0
    my_each {|i| count += 1}
    count
  end

  def my_map(*arg)
    if arg != nil
      proc = arg
      proc.call
    end
    if block_given?
      values = []
      self.my_each {|i| values << (yield i)}
      values
    end
  end
  
  def my_inject
    if block_given?
      mode = self.first
      working = self.drop(1)
      working.my_each {|i| mode = yield(mode, i)}
      mode
    end
  end

end

