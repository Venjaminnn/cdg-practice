ACTORS_LIST = 'actors.txt'

def where(pattern: 'Tom')
  @actor_name = []
  File.foreach(ACTORS_LIST) do |actor|
    @actor_name << actor.chomp if actor.include?(pattern)
  end
  
  pp @actor_name
end

where

