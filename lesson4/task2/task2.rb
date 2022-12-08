require 'pry'
require 'fileutils'
PAINTERS_LIST = 'painters.txt'
RESULT_FILE = 'results.txt'


def where
  clean_file
  loop do
    @file = File.open(PAINTERS_LIST)
    pp "Specify painters age or print -1 to list choosed:"
    age = gets.to_i
    print_file if age.to_i == -1 || identical_painters?
    return if age.to_i == -1 || identical_painters?
    painter_name = @file.readlines.map do |line|
      line.chomp if line.include?(age.to_s)
    end
    
    new_file = File.open(RESULT_FILE, "a+")
    new_file.write(painter_name.compact.join("\n")+"\n")
    new_file.close
    
    print_file if identical_painters?
    return if identical_painters?
  end
end

def clean_file
  result_file = File.open(RESULT_FILE, "w+")
  result_file.write()
  result_file.close
end

def print_file
  File.foreach(RESULT_FILE) do |line|
    pp line.chomp
  end
end

def identical_painters?
  start_file = File.open(PAINTERS_LIST).readlines
  result_file = File.open(RESULT_FILE).readlines
  
  identical = start_file.sort == result_file.sort
end

where 
