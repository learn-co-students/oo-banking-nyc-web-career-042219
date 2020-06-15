# require 'pry'
class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name, balance = 1000, status = "")
    @name = name
    @balance = balance
    @status = "open"
  end

  def deposit(lucre)
    @balance += lucre
  end

  def display_balance
    # binding.pry
    result = "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

end
