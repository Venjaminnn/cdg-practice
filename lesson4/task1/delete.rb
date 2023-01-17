def delete(id = 10)
  file = File.open('buffer.txt', 'w')
  File.foreach('actors.txt').with_index do |actor, index|
    file.puts(id == index ? next : actor)
  end
  
  file.close
  File.write('actors.txt', File.read('buffer.txt'))
  
  File.delete('buffer.txt') if File.exist?('buffer.txt')
end

delete
