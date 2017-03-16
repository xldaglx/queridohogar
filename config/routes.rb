Rails.application.routes.draw do
  resources :contacts
  resources :currencies
  resources :antiques
  resources :property_images
  resources :posts
  resources :additionals
  resources :types
  resources :operations
  resources :images
  resources :properties
  resources :memberships
  devise_for :users, :controllers => { sessions: 'users/sessions' ,:omniauth_callbacks => "users/omniauth_callbacks",  registrations: 'users/registrations' }
  get 'welcome/index'
  root 'welcome#index'
  get 'users/:id' => 'users#show'
  get '/messages/:id' => 'contacts#messages'
  get '/send/' => 'contacts#create'
  get '/list' => 'properties#list'  
  get '/listResults' => 'properties#listResults'  
  get '/deleteImage/:id' => 'property_images#destroy'  
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply, :mark_as_read
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'


  # Example of regular route:
   get 'singupcreate' => 'inmobiliaria#singupcreate'

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
