def find(id = 13)
  file = File.open('actors.txt')
  puts file.readlines[id].chomp
  file.close
end

find
