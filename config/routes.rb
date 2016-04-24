Rails.application.routes.draw do
  
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
  resources :links, :users
  root :to => redirect('/users')
  #get '/links/category/' => '/links#index'
  #get "/show_by_category" => 'links#show_by_category', as: 'show_by_category'
  get 'auth/google_oauth2/callback', to: 'users#create', as: 'signin'
  #get 'auth/failure', to :redirect('/')
  get '/signout' ,to: 'users#destroy', as: 'signout'
  put '/new_admin' => 'users#new_admin', as: 'new_admin'
  get '/admin_page' => 'links#admin_page', as: 'admin_page'
  get '/approval' => 'links#approve_link', as: 'approval'
  post 'approve_or_decline_link' => 'links#approve_or_decline', as: 'approve_or_decline_link'
end
