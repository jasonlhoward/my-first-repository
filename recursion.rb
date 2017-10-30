def factorial(num)
  return "You can't take the factorial of a negative number!" if num < 0
  num <= 1 ? 1 : num * factorial(num - 1)
end

# puts factorial(10)

def bed_wetter?
  puts 'Do you wet the bed?'
  answer = gets.chomp
  case answer
  when 'yes'
    puts 'You\'re gross'
    true
  when 'no'
    puts 'Yeah right'
    false
  else
    puts 'Please answer "yes" or "no"'
    bed_wetter?
  end
end

# bed_wetter?

M = 'land'
o = 'water'

world = [[o,o,o,o,o,o,o,o,o,o,o,o],
         [o,o,o,o,o,o,o,o,o,o,o,o],
         [o,o,o,o,o,o,o,o,o,o,o,o],
         [o,o,o,o,o,o,o,o,o,o,o,o],
         [o,o,o,o,o,o,M,o,o,o,o,o],
         [o,o,o,o,o,M,o,M,o,o,o,o],
         [o,o,o,o,o,o,M,o,o,o,o,o],
         [o,o,o,o,o,o,M,o,o,o,o,o],
         [o,o,o,o,o,M,M,M,o,o,o,o],
         [o,o,o,o,o,o,M,o,o,o,o,o],
         [o,o,o,o,o,o,M,o,o,o,o,o],
         [o,o,o,o,o,o,M,M,o,o,o,o]]

# puts world[6][6]
# puts world.length

def continent_size(world, x, y)
  # puts "#{x}, #{y}"
  # gone over the edge of the world
  return 0 if x < 0 || x >= world.length || y < 0 || y >= world.length
  # found water or counted land
  return 0 if world[x][y] != 'land'

  # we're starting with a tile we know is land, so count it
  size = 1
  world[x][y] = 'counted land'

  # north
  size += continent_size(world, x-1, y)
  # south
  size += continent_size(world, x+1, y)
  # east
  size += continent_size(world, x, y+1)
  # west
  size += continent_size(world, x, y-1)
  # northeast
  size += continent_size(world, x-1, y+1)
  # northwest
  size += continent_size(world, x-1, y-1)
  # southeast
  size += continent_size(world, x+1, y+1)
  # southwest
  size += continent_size(world, x+1, y-1)

  size
end

puts continent_size(world, 6, 6)
