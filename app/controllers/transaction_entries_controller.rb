class TransactionEntriesController < ApplicationController
  def index
    @category = current_user.categories.find(params[:category_id])
    @transaction_entries = @category.transaction_entries.order(created_at: :desc)
  end

  def new
    @category = current_user.categories.find(params[:category_id])
    @transaction_entry = TransactionEntry.new
  end

  def create
    @transaction_entry = TransactionEntry.new(transaction_entry_params)
    @transaction_entry.user = current_user
    @category = current_user.categories.find(params[:category_id])
    @transaction_entry.categories << @category

    if @transaction_entry.save
      redirect_to category_transaction_entries_path, notice: 'Transaction entry was successfully created.'
    else
      render :new
    end
  end

  private

  def transaction_entry_params
    params.require(:transaction_entry).permit(:name, :amount)
  end
end
