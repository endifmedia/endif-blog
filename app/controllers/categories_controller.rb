class CategoriesController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully."
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_post
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
  
end