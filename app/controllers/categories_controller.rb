class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def show
    @category = current_user.categories.find(params[:id])
    @transactions = @category.transactions.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
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
