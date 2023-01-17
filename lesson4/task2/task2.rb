def where
  clean_file
  loop do
    @file = File.open('painters.txt')
    puts "Specify painters age or print -1 to list choosed:"
    age = gets.to_i
    print_file if age.to_i == -1 || identical_painters?
    return if age.to_i == -1 || identical_painters?
    painter_name = @file.readlines.map do |line|
      line.chomp if line.include?(age.to_s)
    end
    
    new_file = File.open('results.txt', "a+")
    new_file.write(painter_name.compact.join("\n")+"\n")
    new_file.close
    
    print_file if identical_painters?
    return if identical_painters?
  end
end

def clean_file
  result_file = File.open('results.txt', "w+")
  result_file.write()
  result_file.close
end

def print_file
  File.foreach('results.txt') do |line|
    puts line.chomp
  end
end

def identical_painters?
  start_file = File.open('painters.txt').readlines
  result_file = File.open('results.txt').readlines
  
  start_file.sort == result_file.sort
end

where 
