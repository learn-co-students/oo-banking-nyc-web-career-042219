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
    if self.sender.valid? && self.receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.status == 'pending'
      if self.sender.balance < self.amount
        self.status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      end

      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      reverse = Transfer.new(self.receiver, self.sender, self.amount)
      reverse.execute_transaction
      self.status = 'reversed'
    end
  end
end
