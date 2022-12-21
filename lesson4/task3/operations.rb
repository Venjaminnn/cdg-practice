START_BALANCE = 100.0.freeze

loop do
  puts "What operation you want to do?"
  options = [
  "D - Deposit",
  "W - Withdraw",
  "B - Show your balance",
  "Q - Quit"
  ]
  
 puts options.join("\n")
 action = gets.chomp.upcase
 case action
 when 'D'
   puts "Enter an amount greater than 0."
   amount = gets.chomp.to_f
   buffer_amount = File.exist?('actors.txt') ? File.open('actors.txt', "r").readlines[0].to_f : START_BALANCE
     if amount <= 0
       puts "Enter an amount greater than 0."
     else
       result_amount = amount + buffer_amount
       account = File.open('actors.txt', "w+")
       account.write(result_amount)
       puts "Your current balance is #{result_amount} USD."
       account.close
     end
  when 'W'
   puts "How much do you want to withdrawl?"
   amount = gets.chomp.to_f
   account_amount = File.exist?('actors.txt') ? File.open('actors.txt', "r").readlines[0].to_f : START_BALANCE
     if amount > account_amount
       puts "There is not enough money on your balance."
     elsif amount <= 0
       puts "Enter an amount greater than 0 or equal to your balance."
     else
       result_amount = account_amount - amount
       account = File.open('actors.txt', "w+")
       account.write(result_amount.round(2))
       puts "Your current balance is #{result_amount} USD."
       account.close
     end
  when 'B'
    amount = File.exist?('actors.txt') ? File.open('actors.txt', "r").readlines[0] : START_BALANCE
    puts "Your balance is #{amount} USD."
  when 'Q'
    break
  else
    "Wrong option. Try again."
  end
end
