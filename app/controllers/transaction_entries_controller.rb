class TransactionEntriesController < ApplicationController
  before_action :authenticate_user!
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

    respond_to do |format|
      if @transaction_entry.save
        format.html { redirect_to categories_path, notice: 'Transaction was successfully created.' }
        format.json { render json: { success: true, message: 'Transaction saved' }, status: :created }
        format.turbo_stream { 
          render turbo_stream: turbo_stream.replace(
            'new_transaction_form',
            partial: 'categories/category',
            locals: { category: @category }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction_entry.errors, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
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
