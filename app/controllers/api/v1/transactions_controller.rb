class Api::V1::TransactionsController < Api::V1::ApiController
  require_relative "../../../services/transaction_service"

  def index
    @result = TransactionService.new(params).call
    if @result                            
      render json: {status: 'SUCCESS',
                    message: 'Created Successfully'}, status: :created  
    else
      render json: {status: 'ERROR', 
                    message: 'INCORRECT  VALUE'}, status: :conflict    
    end
  end


  def show
    @user = User.find params[:id]

    render json: {ID: @user.id, 
                  Name: @user.name, 
                  email: @user.email, 
                  Balance: @user.balance,}, 
                  status: :ok    
  end

end
