def create(name = 'value')
  file = File.open('actors.txt', "a")
  file.puts(name)
  file.close
end

create

