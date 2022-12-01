def foobar
  puts "Укажите первое число:"
  number1 = gets.to_i
  puts "Укажите второе число:"
  number2 = gets.to_i

  if number1 == 20 || number2 == 20
    puts number2
  else
    puts number1 + number2
  end
end

