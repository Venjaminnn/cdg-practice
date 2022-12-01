def match_cs
  word = gets.chomp
  if word.end_with?('cs', 'CS')
    puts 2**word.size
  else 
    puts word.reverse
  end
end

match_cs
