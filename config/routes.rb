require 'sidekiq/web'
Rails.application.routes.draw do
  namespace :admin do
  get 'dashboard/index'
  end

  resources :users do
    member do
      get :tasks
      post :tasks
    end
  end

  resources :sessions,only: [:new, :create, :destroy]
  resources :reviews,only: [:index, :create, :destroy]
  match '/reviews/latest', to: 'reviews#latest',via: 'get'


  root 'static_pages#home'


  match '/feed', to: 'reviews#feed',via: 'get', :defaults => { :format => 'rss' }
  # match '/help',to: 'static_pages#help',via: 'get'
  match '/signup', to: 'users#new',via: 'get'
  match '/signin', to: 'sessions#new',via: 'get'
  match '/settings', to: 'users#settings',via: 'get'
  match '/signout', to: 'sessions#destroy',via: 'delete'

  match '/foursquare', to: 'foursquare_statistics#information',via: 'get'
  match '/instagram', to: 'instagram_statistics#information',via: 'get'
  match '/search_instagram', to: 'instagram_statistics#search',via: 'post'
  match '/twitter', to: 'twitter_statistics#information',via: 'get'
  match '/search_twitter', to: 'twitter_statistics#search', via: 'post'

  match '/404' , to: 'errors#error404',via: [:get,:post,:delete,:patch]

  match '/add', to: 'tools#add', via: 'post'
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    match '/clients', to: 'dashboard#clients', via: 'get'
    match '/tools', to: 'dashboard#tools', via: 'get'
    match '/tools', to: 'dashboard#create_tool', via: 'post'
  end

    mount Sidekiq::Web => '/sidekiq'

  get '/change_locale/:locale', to: 'users#change_locale', as: :change_locale

  match '/request/save',to: 'instagram_statistics#save_request',via: 'post'
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
