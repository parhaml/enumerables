require_relative 'enumerables.rb'

values = [1, 2, 3, 4, 5]

map_proc = Proc.new do
  puts "proc time"
end

puts values.my_map(map_proc)

