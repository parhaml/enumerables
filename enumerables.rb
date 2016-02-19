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

  def my_map
    values = []
    self.my_each {|i| values << (yield i)}
    values
  end
  
  def my_inject
    puts "running function"
    final = 0
    self.my_each {|i| final += i}
    final
  end


end

