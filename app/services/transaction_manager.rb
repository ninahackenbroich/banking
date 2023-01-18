class TransactionManager < ApplicationService

  def initialize(params)
    @params = params
  end

  def call
    set_account
    @prev_balance = @account.balance
    build_transaction(transaction_params)

    if transaction_params[:iban]
      set_receiver    
    end

    update_transaction_status

    if @transaction.transaction_status == "approved"
      update_account_balance 
    end

    if @transaction.save!
      return { transaction: @transaction, balance: @account.balance, prev_balance: @prev_balance }
    else
      return @transaction.errors 
    end
  end

  private

  def build_transaction(transaction_params)
    @transaction = Transaction.new(transaction_params)
    @transaction.account = @account
    @transaction.transaction_status = 3
    @transaction.transaction_date = Date.today
  end

  def update_account_balance 
    # binding.pry
    case @transaction.transaction_type
    when "withdraw"
      @account.balance -= transaction_params[:amount].to_f
    when "deposit"
      @account.balance += transaction_params[:amount].to_f
    when "transfer"
      @account.balance -= transaction_params[:amount].to_f
      @account.save
      @receiver.balance += transaction_params[:amount].to_f
      @receiver.save
    end
  end

  def update_transaction_status
    # binding.pry
    if ((@transaction.transaction_type == "withdraw" || @transaction.transaction_type == "transfer" ) && (@transaction.amount.to_f <= @account.balance.to_f)) || @transaction.transaction_type == "deposit"
      @transaction.transaction_status = 1
    elsif  @transaction.transaction_type.nil?
      @transaction.transaction_status = 4
    else
      @transaction.transaction_status = 2
    end
  end

  def set_receiver
    @receiver = Account.find_by(iban: transaction_params[:iban])
  end

  def transaction_params
    @params.require(:transaction).permit(:iban, :amount, :transaction_type, :transaction_status)
  end

  def set_account
    @account = Account.find(@params[:account_id].to_i)
  end

end