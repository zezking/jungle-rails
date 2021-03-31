class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @product.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end

  
end
