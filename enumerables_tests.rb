require_relative 'enumerables.rb'



values = [1, 2, 3, 4, 5]
puts (5..10).my_inject { |sum, n| sum + n}
