class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user
    @categories = current_user.categories
    @data = @categories.pluck(:name, :total_amount)
  end

  def new
    @category = current_user.categories.new
  end

  def create
    new_category = current_user.categories.new(category_params)
    if new_category.save
      redirect_to user_path
      flash[:notice] = 'Category was created!'
    else
      redirect_to new_category_path
      flash[:alert] = 'Category was not created!'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
