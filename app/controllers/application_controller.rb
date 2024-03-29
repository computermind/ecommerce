class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :categories, :brands
  
  def categories
    @categories = Category.all
  end
  
  def brands
    @brands =Product.pluck(:brand).sort.uniq!
    if @brands == nil
     @brands = Product.pluck(:brand).sort
    end
    #.pluck(:brand) will build our array of just brand names (strings)
    #.sort will put them in alphabetical order
    #.uniq! will take out any duplicates
  end
  
#  def after_sign_in_path_for(resource)
#    app_dashboard_index_path
#  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  
end
