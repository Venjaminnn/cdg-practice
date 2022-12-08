ACTORS_LIST = 'actors.txt'

def find(id: 13)
  file = File.open(ACTORS_LIST)
  pp file.readlines[id].chomp
  file.close
end

find
