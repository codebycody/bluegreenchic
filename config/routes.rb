Rails.application.routes.draw do
  devise_for :users

  get "/" => 'sites#home'
  get "/stores/brands/:brand" => 'stores#by_brand'
  
  resources :stores do
    member do
      post "like" => "stores#like"
      post "unlike" => "stores#unlike"
    end
  end
  resources :brands do
    member do
      post "like" => "brands#like"
      post "unlike" => "brands#unlike"
    end
  end
  resources :keyvalues
  resources :users, only: [:show]

  resources :posts do
    member do
      post "like" => "posts#like"
      post "unlike" => "posts#unlike"
    end
    resources :comments, only: [:create, :destroy]
  end

  #api
   scope "/api" do
      resources :keyvalues, controller: :keyvalues_api, only: [:index, :show]
      end
  end





# scope "/api" do
#     resources :sandwiches do
#       resources :ingredients
#     end
#     post "/sandwiches/:id/ingredients/add" => "sandwiches#add_ingredient"
#   end
  
  # resources :brands do
  #   resources :keyvalues, only: [:create]
  # end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
