class TransactionEntriesController < ApplicationController
  before_action :set_category

  def index
    @transaction_entries = @category.transaction_entries.order(created_at: :desc)
  end

  def new
    @transaction_entry = @category.transaction_entries.build
  end

  def create
    @transaction_entry = @category.transaction_entries.build(transaction_entry_params)
    @transaction_entry.user = current_user

    if @transaction_entry.save
      redirect_to categories_path, notice: 'Transaction was successfully added.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def transaction_entry_params
    params.require(:transaction_entry).permit(:name, :amount, :date, :recurring)
  end
end
