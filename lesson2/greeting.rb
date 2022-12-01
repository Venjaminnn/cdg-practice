def greeting
  puts "Укажите Ваше имя:"
  name = gets.chomp
  puts "Укажите Вашу фамилию:"
  surname = gets.chomp
  puts "Укажите Ваш возраст:"
  age = gets.to_i

  if age < 18
    puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано."
  else
    puts "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end
