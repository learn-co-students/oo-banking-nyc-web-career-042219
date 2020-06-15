class Transfer

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@counter = 0 
  	@status = "pending"
  end

  def valid?
  	sender.valid? && receiver.valid?
  end

  def execute_transaction
  	if valid? && @amount < sender.balance && @status == "pending"
  		sender.balance -= @amount
  		receiver.balance += @amount
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
