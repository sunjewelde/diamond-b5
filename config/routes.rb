require 'sidekiq/web'
Rails.application.routes.draw do
  get 'indices/index'
  get 'diamonds/index_mobile' => "diamonds#index_mobile"
  get 'tables/chart_second_mobile' => "tables#chart_second_mobile"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'sessions/new'

  get 'users/new'

  get 'tables/new'
  get 'lists/new'

  get 'diamonds/chart' => "diamonds#chart"

  get 'diamonds/manage_data' => "diamonds#manage_data"
  
  get 'lists/list_table' => "lists#list_table"

  get 'lists/show' => "lists#show"

  get 'tables/chart_second' => "tables#chart_second"
  
  root to: 'diamonds#index'
  
  mount Sidekiq::Web, at: '/sidekiq'
  
  post 'diamonds/run'
  
  post 'diamonds/make_list'
  
  post 'diamonds/make_index'
  
  post 'diamonds/import'
  
  get ".well-known/pki-validation/fb9df9f4770a8340de03556d4ad74f07.txt" => "diamonds#sslvalid"

  # resources :diamonds do
  # 	collection do
  # 		post :import
  # 	end
  # end
  
  get 'signup',  to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

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
