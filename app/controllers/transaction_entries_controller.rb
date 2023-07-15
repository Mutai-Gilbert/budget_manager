class TransactionEntriesController < ApplicationController
  def new
    @category = current_user.categories.find(params[:category_id])
    @transaction = TransactionEntry.new
  end

  def create
    @transaction_entry = TransactionEntry.new(transaction_entry_params)
    @transaction_entry.save

    redirect_to categories_path(transaction_entry_form_data: transaction_entry_params)
  end

  private

  def transaction_entry_params
    params.require(:transaction_entry).permit(:name, :amount)
  end
end
