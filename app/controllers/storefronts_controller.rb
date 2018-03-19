class StorefrontsController < ApplicationController
  
  skip_before_action :authenticate_user!
  
  def all_items
    @products = Product.all
  end

  def items_by_category
    @categories = Category.all
  end

  def items_by_brand
#    @brands = Product.where(params[:brand])
  end
end
