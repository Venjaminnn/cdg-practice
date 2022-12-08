require 'fileutils'
ACTORS_LIST = 'actors.txt'

def create(name: 'Woody Harrelson')
  file = File.open(ACTORS_LIST, "a")
  file.puts(name)
  file.close
end

create

