class StorefrontsController < ApplicationController
  
  skip_before_action :authenticate_user!
  
  def all_items
    @products = Product.all
  end

  def items_by_category
#    @categories = Category.all
     @category = Category.find(params[:cat_id])
     @products = Product.all
     @products_by_cat = []
     @products.each do |product|
       if product.category.id == params[:cat_id].to_i
         @products_by_cat.push(product)
       end
     end
  end

  def items_by_brand
#    @brands = Product.where(params[:brand])
     @brand_name = params[:brand]
     @products = Product.all
     @products_by_brand = []
     @products.each do |product|
       if product.brand == params[:brand]
         @products_by_brand.push(product)
       end
     end
  end
end
