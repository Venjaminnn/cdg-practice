def update(id = 13 , name = 'value')
  file = File.open('buffer.txt', 'w')
  File.foreach('actors.txt').with_index do |actor, index|
    file.puts(id == index ? name : actor)
  end

  file.close
  File.write('actors.txt', File.read('buffer.txt'))
  
  File.delete('buffer.txt') if File.exist?('buffer.txt')
end

update
