class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy bookmark]
  def index
    @categories = Category.bookmarked
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params_category)
    unless @category.errors.any?
      redirect_to categories_path, notice: I18n.t('messages.models.category.created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to categories_path, notice: I18n.t('messages.models.category.updated')
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @category.destroy
  end

  def bookmark
    @category.update(bookmarked: params[:bookmark])
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:name, :description)
  end
end
