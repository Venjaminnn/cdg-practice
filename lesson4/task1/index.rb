def index
  File.foreach('actors.txt') { |actor| puts actor.chomp}
end

index

file.close
