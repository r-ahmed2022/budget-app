class EntitiesController < ApplicationController
    load_and_authorize_resource

  def index
    @category = Category.find(params[:category_id])
    @category_entities = CategoryEntity.includes(:entity).where(category_id: params[:category_id])
      .order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories
  end

  def create
    if at_least_one_check_box
      entity = current_user.entities.new(name: params[:name], amount: params[:amount])

      if entity.save
        selected_categories_ids.each do |sc|
          category_entity = CategoryEntity.new(entity_id: entity.id, category_id: sc)
          unless category_entity.save
            reload_page
            flash[:alert] = 'A transaction was not created!'
          end
        end
        redirect_to category_entities_path(category_id: params[:category_id])
        flash[:notice] = 'Transaction created successfully!'
      else
        reload_page
        flash[:alert] = 'Add Name and Amount!'
      end
    else
      reload_page
      flash[:alert] = 'Select at least one category!'
    end
  end

  private

  def at_least_one_check_box
    return false if selected_categories_ids.nil?

    true
  end

  def selected_categories_ids
    params[:categories]
  end

  def reload_page
    redirect_to new_category_entity_path(category_id: params[:category_id])
  end
end
