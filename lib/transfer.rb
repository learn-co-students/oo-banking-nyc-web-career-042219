class Transfer


    attr_accessor :status, :sender, :receiver, :amount

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
      @stored_transfer_amount = 0
    end

    def valid?
      sender.valid? && receiver.valid?
    end

    def execute_transaction
        if valid? && @amount < sender.balance && @status == "pending"
          sender.balance -= @amount
          receiver.balance += @amount
          @status = "complete"
          @stored_transfer_amount = @amount
        else
          @status = "rejected"
		      "Transaction rejected. Please check your account balance."
        end
    end

    def reverse_transfer
      receiver.balance -= @stored_transfer_amount
      sender.balance += @stored_transfer_amount
      @status = "reversed"
    end


end
