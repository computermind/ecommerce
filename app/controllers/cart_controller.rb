class CartController < ApplicationController

  before_action :authenticate_user!, except => [:add_to_cart, :view_order]
  
  def add_to_cart
    product = Product.find(params[:product_id])
    if product.quantity < params[:quantity].to_i
      redirect_to view_order_path, notice: "Not enough quantity in stock."
    else
    	line_item = LineItem.new
    	line_item.product_id = params[:product_id].to_i
    	line_item.quantity = params[:quantity]
      if user_signed_in?
        line_item.customer_key = current_user.id
      else
        line_item.customer_key = remote_ip
      end
    	line_item.save

    	line_item.line_item_total = line_item.quantity * line_item.product.price
    	line_item.save

    	redirect_to view_order_path
    end
  end

  def remove_from_cart
    LineItem.find(params[:id]).destroy
    
    redirect_to view_order_path
  end
  
  def edit_line_item
  line_item = LineItem.find(params[:id])
  
    if Product.find(line_item.product_id).quantity < params[:quantity].to_i
    redirect_to view_order_path, notice: "Not enough quantity in stock to cover larger order"
    else
    line_item.quantity = params[:quantity].to_i
    line_item.save
    redirect_to view_order_path
    end
  end

  def view_order
    if user_signed_in?
    	@line_items = LineItem.where(customer_key: current_user.id.to_s)
    else
      @line_items = LineItem.where(customer_key: remote_ip)
    end
  end

  def checkout
  	@line_items = LineItem.all
  	@order = Order.new
  	@order.user_id = current_user.id

  	sum = 0

  	@line_items.each do |line_item|
  		@order.order_items[line_item.product_id] = line_item.quantity
  		sum += line_item.line_item_total
  	end

  	@order.subtotal = sum
  	@order.sales_tax = sum * 0.07
  	@order.grand_total = sum + @order.sales_tax
  	@order.save

  	@line_items.each do |line_item|
  		line_item.product.quantity -= line_item.quantity
  		line_item.product.save
  	end

  	LineItem.destroy_all
  end
  
end
