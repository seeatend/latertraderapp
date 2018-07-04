Rails.application.routes.draw do
  
 

  resources :states, only: :index
  resources :b2b_ordered_items
  resources :contacts
  resources :b2b_orders
  get 'credit_approval/index'

  resources :product_requests
  resources :addmembers do
    post 'add_to_network', :on => :collection
  end
  resources :supplies
  get 'b2b/index'

  get 'walk_in/index'

  get 'operator/index'

 

  resources :order_histroy
  resources :after_b2b_order
resources :after_order
resources :orders
  resources :walk_in
  resources :packings
  resources :operator
  resources :feedbacks
  resources :credits do
    post 'credit_update', :on => :collection
  end
  resources :privateoffers
  resources :approval
  resources :slabs
  resources :offer_steps
  resources :invites
  get 'gridmarketplace/index'

  resources :notifications
  resources :claim_wastages
  namespace :admin do
    resources :admins
    resources :users
    resources :carts
    resources :chats
    resources :cheps
    resources :customers
    resources :employees
    resources :forklifts
    resources :growers
    resources :marketplaces
    resources :messages
    resources :networks
    resources :offers
  
    resources :ordered_items
    resources :products
    resources :purchases
    resources :reports
    resources :sales
    resources :sellers
    resources :services
    resources :settings
    resources :stocks

    root to: "admins#index"
  end

resources :buyer_steps
  resources :messages
  resources :cheps
  resources :forklifts
  resources :employees
  get '/home', :to => redirect('/index.html')

resources :after_signup
resources :seller_steps
  resources :chats do
    post 'customer_message', :on => :collection
    post 'seller_message', :on => :collection
  end
  resources :ordered_items do
    post 'approve_order', :on => :collection
    post 'walk_in_add_items', :on => :collection
  end 
  resources :settings
  resources :reports
  resources :networks
  resources :services
  resources :sales
  resources :purchases
  resources :marketplaces
  resources :customers
  devise_for :admins
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :offers
  resources :sellers
  resources :stocks
  resources :growers
  resources :products
  resources :dashboard
  resources :gridmarketplace
  resources :cart do
  post 'checkout', :on => :collection
  post 'add_to_cart', :on => :collection
end

  root to: "marketplaces#index"
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
end
