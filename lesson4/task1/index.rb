ACTORS_LIST = 'actors.txt'
file = File.open(ACTORS_LIST)

def index
  File.foreach(ACTORS_LIST) { |actor| pp actor.chomp}
end

index

file.close
