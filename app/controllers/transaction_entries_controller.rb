class TransactionEntriesController < ApplicationController
  def index
    @category = current_user.categories.find(params[:category_id])
    @transaction_entries = @category.transaction_entries.order(created_at: :desc)
    @total_sum = @transaction_entries.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction_entry = @category.transaction_entries.build
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction_entry = @category.transaction_entries.build(transaction_entry_params)
    @transaction_entry.user = current_user

    category_id = @category.id

    if category_id.present?
      category = Category.find(category_id)
      @transaction_entry.categories << category
    end

    respond_to do |format|
      if @transaction_entry.save
        format.html do
          redirect_to category_transaction_entries_path(@category),
                      notice: 'Transaction entry was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction_entry }
      else
        format.html { render :new, alert: 'Transaction entry was not created.' }
        format.json { render json: @transaction_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def transaction_entry_params
    params.require(:transaction_entry).permit(:name, :amount)
  end
end
