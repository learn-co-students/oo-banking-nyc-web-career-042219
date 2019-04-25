require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && @status == "pending" && amount < @sender.balance
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
      @@transfers << self
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    amount = @@transfers.last.amount
    sender = @@transfers.last.sender
    receiver = @@transfers.last.receiver

    sender.balance += amount
    receiver.balance -= amount
    @@transfers.last.status = "reversed"
  end

end
