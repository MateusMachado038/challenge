class Api::V1::TransactionsController < Api::V1::ApiController
    before_action :set_user, only: [:show]
    before_action :set_calc

 
    def index
        source = params.require(:source_account_id)
        destination = params.require(:destination_account_id)
        amount = params.require(:amount)
          
    okSend = User.find_by_id(source)   
    okReceive = User.find_by_id(destination)                   
    if okSend != nil  and  okReceive !=nil
      @varsend = okSend
      @varreceive = okReceive

    
        sendID = @varsend.id
        receiveID = @varreceive.id
      
    
        if amount.to_i <= @varsend.balance and amount.to_i > 0
            transaction = Transaction.create(sendd:   amount  ,   receivee: 0 , user_id: sendID)
            transaction = Transaction.create(sendd:    0 ,   receivee: amount , user_id: receiveID)
    
            render json: {status: 'SUCCESS', message: 'created successfully'}, status: :created    
        else
            render json: {status: 'ERROR', message: 'INCORRECT  VALUE'}, status: :conflict    
        end

    else
        render json: {status: 'Error', message: 'Unknown User' }, status: :unprocessable_entity    
    end

    set_calc
 end



def show

    @user = User.find(params[:id]) 
    render json: {ID: @user.id, Name: @user.name, email: @user.email, Balance: @user.balance}, status: :ok    

end



            private

def set_user

    ok = User.find_by_id params[:id]                      
              if ok != nil
                @user = ok
              else
                render json: {status: 'Error', message: 'Unknown User' }, status: :unprocessable_entity    
            end
  end


  
 def set_calc

    tamanho = Transaction.count
    tamanho2 = User.count
    count2 = 1

    while count2 <= tamanho2
    @user = User.find(count2)

    count = 1
    calc = 0
    send = 0
    receive = 0
     
    while count <= tamanho
 
     @transaction =  Transaction.find(count)
 
     if @transaction.user_id == @user.id
        send += @transaction.sendd
        receive += @transaction.receivee
     end

    count += 1
 end

 calc = receive - send

 @user.update(balance: calc)

 count2 += 1
    end
end



end


