require_relative 'enumerables.rb'



def multiply_els(arr)
  arr.my_inject{|mode, i| mode * i}
end

puts multiply_els([2, 4, 5])