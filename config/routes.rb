Rails.application.routes.draw do

  get 'jours/:id/newpaps', to: 'jours#newpaps', as: 'newpaps'
  get 'jours/:id/newcreneau', to: 'jours#newcreneau', as: 'newcreneau'
  get 'jours/:id/showtentatives', to: 'jours#showtentatives', as: 'showtentatives'
  get 'welcome/index'

  get '/papshere', :to => 'welcome#papshere' 
  get '/barcreneaux', :to => 'welcome#barcreneaux' 

  devise_for :users
  resources :users
  resources :bars
  resources :jours
  resources :paps
  resources :creneaus
  resources :tentatives

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

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
