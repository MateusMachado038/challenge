  class TransactionService  
    
    def initialize(params)   
      @source = User.find params[:source_account_id] 
      @destination = User.find params[:destination_account_id]  
      @amount = params[:amount]    
    end

    def call
      return false unless (@amount.to_i <= @source.balance && @amount.to_i > 0)

      ActiveRecord::Base.transaction do
        create_transaction(@source, @amount, 0)     
        create_transaction(@destination, 0, @amount)               
        update_destination_balance
        update_source_balance
      end 
      true
    rescue
      false 
    end

    private

    def create_transaction(user, sendd,  receivee)
      Transaction.create!(sendd: sendd, 
                          receivee: receivee, 
                          user_id: user.id)
    end

    def update_destination_balance
      @destination.balance = balance(@destination) 
      @destination.save!                  
    end

    def update_source_balance
      @source.balance = balance(@source) 
      @source.save!   
    end

    def balance(user)
      Transaction.where(user_id: user.id)
                 .select('sum(receivee) - sum(sendd) as balance')
                 .first
                 .balance  
    end
end