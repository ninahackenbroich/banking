class TransactionsController < ApplicationController
  def create
    begin
      ActiveRecord::Base.transaction do
        object = TransactionManager.call(params)
        render json: { transaction: object[:transaction], balance: object[:balance], previous_balance: object[:prev_balance]}, status: :created
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e }, status: :not_found
    rescue ActiveRecord::ActiveRecordError => e
      render json: { error: e }, status: :unprocessable_entity
    rescue StandardError => e
      render json: { error: e }, status: :unprocessable_entity
    rescue Exception => e
      render json: { error: e }, status: :unprocessable_entity
    end
  end
end
