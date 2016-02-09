Rails.application.routes.draw do
  root 'yoga_classes#index'
  resources :weeks

  # get 'yoga_classes/index'

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

  get     '/users/new', to: 'users#new'
  post    '/users', to: 'users#create'
  get     '/users/:id', to: 'users#show', as: 'user_classes'
  get     '/users/:id/settings', to: 'users#edit', as: 'user_settings'
  post    '/users/:id/settings', to: 'users#update'
  patch   '/users/:id/settings', to: 'users#update'
  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  
  get     '/yoga_classes', to: 'yoga_classes#index'
  post    '/yoga_classes', to: 'yoga_classes#create'
  get     '/yoga_classes/new', to: 'yoga_classes#new', as: 'new_yoga_class'
  get     '/yoga_classes/:id', to: 'yoga_classes#show', as: 'yoga_class'
  delete  '/yoga_classes/:id', to: 'yoga_classes#destroy'
  
  post    '/yoga_classes/:yoga_class_id/yoga_sessions', to: 'yoga_sessions#create', as: 'new_yoga_session'
  delete  '/yoga_classes/:yoga_class_id/yoga_sessions/:id', to: 'yoga_sessions#destroy', as: 'yoga_session'
  
  # resources :yoga_classes do
#     resources :yoga_sessions
#   end

  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"
end
