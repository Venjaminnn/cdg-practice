require 'fileutils'
ACTORS_LIST = 'actors.txt'
BUFFER = 'buffer.txt'

def delete(id: 10)
  file = File.open(BUFFER, 'w')
  File.foreach(ACTORS_LIST).with_index do |actor, index|
    file.puts(id == index ? next : actor)
  end
  
  file.close
  File.write(ACTORS_LIST, File.read(BUFFER))
  
  File.delete(BUFFER) if File.exist?(BUFFER)
end

delete
