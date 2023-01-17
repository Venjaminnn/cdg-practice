def where(pattern = 'value')
  actor_name = []
  File.foreach('actors.txt') do |actor|
    actor_name << actor.chomp if actor.include?(pattern)
  end
  
  puts actor_name
end

where

