class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
    @transaction_entry_form_data = params[:transaction_entry_form_data]
  end

  def show
    @category = Category.find(params[:id])
    @transaction_entries = @category.transaction_entries
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, alert: 'Category was not created.'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
