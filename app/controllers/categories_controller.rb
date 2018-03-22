class CategoriesController < ApplicationController
  
  before_action :check_admin
  
  def index
    @products = Product.all
  end
  
  
  
  private
# check to see if user is an admin
  def check_admin
    unless current_user.role == "admin"
        flash[:alert] = "You don't have that level of clearance bubba!"
        redirect_to root_path
    end
  end
  
end
