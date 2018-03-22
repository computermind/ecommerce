Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  get 'categories/check_admin'

  root 'storefronts#all_items'
  
  post 'add_to_cart' => 'cart#add_to_cart'
  get 'view_order' => 'cart#view_order'
  get 'checkout' => 'cart#checkout'

  resources :line_items
  resources :orders
  devise_for :users

  get 'all' => 'storefronts#all_items'
	get 'categorical' => 'storefronts#items_by_category'
  get 'branding' => 'storefronts#items_by_brand'

  resources :products
  resources :categories
  
end
