Rails.application.routes.draw do

  devise_for :users
#  get 'storefronts/all_items'

#  get 'storefronts/items_by_category'

#  get 'storefronts/items_by_brand'
  
  root 'storefronts#all_items'

  get 'categorical' => 'storefronts#items_by_category' 

  get 'branding' => 'storefronts#items_by_brand'
  
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
