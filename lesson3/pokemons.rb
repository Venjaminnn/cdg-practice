def list_pokemons 
  pokemon_size = gets.chomp.to_i
  pokemon_size = (1..pokemon_size).to_a 
  result = pokemon_size.map do |_| 
    pp 'What name of Pokemon?' 
    name = gets.chomp 
    pp 'What color of Pokemon?' 
    color = gets.chomp 
    {name: name.capitalize, color: color.capitalize} 
  end
  pp result
end

list_pokemons

def list_pokemons
  pp 'How many Pokemon do you need?'
  amount = gets.to_i 
  result = []
  amount.times do |_|
    pp 'What name of Pokemon?'
    name = gets.chomp
    pp 'What color of Pokemon?' 
    color = gets.chomp
    result << { name: name.capitalize, color: color.capitalize }
  end
  pp result
end

list_pokemons
