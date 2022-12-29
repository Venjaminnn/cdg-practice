require 'pry'

class Atm
  attr_reader :result_amount, :errors
  START_BALANCE = 100.0.freeze

  def initialize(amount)
    @amount = amount
    @current_amount = File.exist?(file) ? File.open(file, "r").readlines[0].to_f : START_BALANCE
    @result_amount = nil
    @errors = nil
  end

  def deposit
    if @amount <= 0
      @errors = "Enter an amount greater than 0."
    else
      @result_amount = @amount + @current_amount
      account = File.open(file, "w+")
      account.write(@result_amount)
      account.close

      @result_amount
    end
  end

  def withdraw
    if @amount > @current_amount
      @errors = "There is not enough money on your balance."
    elsif @amount <= 0
      @errors = "Enter an amount greater than 0 or equal to your balance."
    else
      @result_amount = @current_amount - @amount
      account = File.open(file, "w+")
      account.write(@result_amount.round(2))
      account.close

      @result_amount
    end
  end

  def balance
    @result_amount = File.exist?(file) ? File.open(file, "r").readlines[0].to_f : START_BALANCE
  end

  private

  def file
    ENV['environment'] == 'test' ? 'test.txt' : 'balance.txt'
  end
end
