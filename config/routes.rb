Rails.application.routes.draw do
  get 'storefronts/all_items'

  get 'storefronts/items_by_category'

  get 'storefronts/items_by_brand'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
