require 'pry'
class Transfer
  # your code here

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    end
  end

    def execute_transaction
      if sender.balance < @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    end
  end

  def reverse_transfer
    # binding.pry
    # if sender.balance < @amount
    #   @status = "rejected"
    #   "Transaction rejected. Please check your account balance."
    # elsif @status == "pending"
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"

    end
  end

end
