Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # backend 
  namespace :admin do
    resources :dashboard, :groups, :categories, :products, :menus
    #
    devise_for :users, class_name: "Admin::User", controllers: {
      confirmations: "admin/users/confirmations",
      # omniauth_callbacks: "admin/users/omniauth_callbacks",
      passwords: "admin/users/passwords",
      registrations: "admin/users/registrations",
      sessions: "admin/users/sessions", 
      unlocks: "admin/users/unlocks"       
    }
    root 'dashboard#index'
  end
  # frontend
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions", 
    unlocks: "users/unlocks"       
  }
  
  # site
  resources :site do
    collection do
      get 'find'
      post 'spec'
      post 'cart_add'
      post 'cart_del'
    end

    member do
      # post 'spec'
    end
  end

  resources :search

  resources :shopping

  resources :myaccount

  root 'site#index'
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
