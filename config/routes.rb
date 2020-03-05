Rails.application.routes.draw do

  # create a session when a user authenticates via facebook
  match 'auth/:provider/callback', to: 'sessions#create', :via => [:get]
  # redirect to homepage on authentication failure
  match 'auth/failure', to: redirect('/'), :via => [:get]
  # destroy session on signout
  match 'signout', to: 'sessions#destroy', as: 'signout', :via => [:delete]
  
  get 'users/me' => 'users#show_personal_profile'

  get 'users/:id' => 'users#show'

  get 'users/:id/edit' => 'users#edit'

  put 'users/:id' => 'users#update'


  get 'comments/new/:post_type/:id' => 'comments#new_comment'
  post 'comments/:post_type/:id' => 'comments#create_comment'

  resources :tutor_searches
  resources :tutee_searches
  resources :comments

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#show'

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
  #   resources :tutor_searches, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
