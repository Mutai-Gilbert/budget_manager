class CategoriesController < ApplicationController
  before_action :ensure_default_categories, only: [:index]

  def index
    @categories = current_user.categories
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

  def create_defaults
    default_categories = [
      { name: 'Housing', icon: 'house' },
      { name: 'Savings', icon: 'savings' },
      { name: 'Transportation', icon: 'car' },
      { name: 'Food', icon: 'food' },
      { name: 'Utilities', icon: 'utility' },
      { name: 'Others', icon: 'misc' }
    ]

    default_categories.each do |category|
      current_user.categories.find_or_create_by(name: category[:name]) do |c|
        c.icon = category[:icon]
      end
    end
  end

  private

  def ensure_default_categories
    default_categories = [
      { name: 'Housing', icon: 'house' },
      { name: 'Savings', icon: 'savings' },
      { name: 'Transportation', icon: 'car' },
      { name: 'Food', icon: 'food' },
      { name: 'Utilities', icon: 'utility' },
      { name: 'Others', icon: 'misc' }
    ]

    default_categories.each do |category|
      current_user.categories.find_or_create_by(name: category[:name]) do |c|
        c.icon = category[:icon]
      end
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
