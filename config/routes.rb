Citymix::Application.routes.draw do
 
   resources :connectionsizes
   resources :connections
   resources :storages
   resources :users do
    member do
      get :following
      get :followers
    end
   end
   match "/search",     to: "products#locate", via: :get 
 
  resources :kategories do
      resources :group_tovs
  end
  resources :group_tovs
  resources :types do
      member do
         match "/filter_type",  to: "types#products", via: :get
      end
  end
  resources :brands do
      member do
         match "/filter_brand",  to: "brands#products", via: :get
      end
  end
  resources :seasons do
      member do
         match "/filter_season",  to: "seasons#products", via: :get
      end
  end
  resources :manufacturers do
      member do
         match "/filter_manufacturer", to: "manufacturers#products", via: :get
      end
  end
  resources :colors do
      member do
         match "/filter_color", to: "colors#products", via: :get
      end
  end
  resources :necks do
      member do
         match "/filter_neck", to: "necks#products", via: :get
      end
  end
  resources :sizes do
      member do
         match "/filter_size", to: "sizes#products", via: :get
      end
  end
  resources :fasteners do
      member do
         match "/filter_fastener", to: "fasteners#products", via: :get
      end
  end
  resources :products do
      member do
         match "/search",           to: "products#search",  via: :get
         match "/cancel",           to: "products#cancel",  via: :get
         match "/colors",           to: "products#colors",  via: :get
         match "/photo",            to: "products#show_photo_color", via: :get
      end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy] 
  resources :orders
  resources  :additional_photos
  match "/info_orders", to: "orders#info_orders", via: :get
  resources :baskets  
  match "/change_numbers", to: "baskets#change_numbers", via: :get
  match "/del_basket_all", to: "baskets#del_basket_all", via: :get
  match "/make_delivery",  to: "baskets#make_delivery",  via: :get 
  
  root                 to: "static_pages#index"
  match '/signup',     to: 'users#new', via: :get 
  match '/signin',     to: 'sessions#new', via: :get
  match '/signout',    to: 'sessions#destroy', via: :delete
  get   "/help",       to: "static_pages#help"
  get   "/about",      to: "static_pages#about"
  get   "/mens",       to: "static_pages#men_odezhda"
  match "/sendpass",   to: "users#send_pass", via: :get
  match  "/flt_by_kategory", to: "products#flt_by_kategory", via: :get
  match  "/flt_by_group_tov", to: "products#flt_by_group_tov", via: :post
  match  "/sbros_flt", to: "products#sbros_flt", via: :get



 # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root 'welcome#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  #     resources :products
  #   end
  #   end
end

