class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @counter = 0
  end

  def valid?
    if sender.valid? == true  && receiver.valid? == true
      true
    else
      false
  end
end

  def execute_transaction
    if valid? && @amount < sender.balance && @status == "pending"
      receiver.balance += @amount
      sender.balance -= @amount
      @status = "complete"
      @counter = @amount
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
end

  def reverse_transfer
    receiver.balance -= @counter
    sender.balance += @counter
    @status = "reversed"
  end


end
