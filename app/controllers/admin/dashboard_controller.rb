class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
      @products = Product.order(id: :desc).all
      @category = Category.all
  end

end