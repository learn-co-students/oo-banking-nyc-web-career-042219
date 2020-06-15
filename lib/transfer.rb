require 'pry'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      self.sender.balance -= amount
      if self.valid?
        self.receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."

      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

    #
    end
  end

  def reverse_transfer
    if self.execute_transaction
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
  end




end
