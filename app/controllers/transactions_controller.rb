class TransactionsController < ApplicationController
  
  def new
    @category = current_user.categories.find(params[:category_id])
    @transaction = Transaction.new
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @transaction = @category.transactions.new(transaction_params)
    @transaction.user = current_user
    if @transaction.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
