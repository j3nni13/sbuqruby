Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :eventtypes
  resources :venuetypes
  resources :receptions
  resources :alcohols
  resources :foods
  resources :amenities
  resources :pages
  resources "contacts", only: [:new, :create]
  resources :listings do
    collection do
      match 'search' => 'listings#search', via: [:get, :post], as: :search
    end
  end
  resources :favourite_listings, only: [:create, :destroy]
  resources :pictures
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
    collection do
    delete :empty_trash
  end
  end
  

  devise_for :admins, controllers: {registrations: 'registrations'}
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'pages#home'

  get 'dashboard' => "pages#dashboard"
  get 'favourites' => "pages#favourites"
  get 'dminlistings' => "pages#dminlistings"
  get 'search' => "listings#search"
  get 'faq' => "pages#faq"
  get 'howitworks' => "pages#howitworks"
  get 'aboutus' => "pages#aboutus"
  get 'fees' => "pages#fees"
  
  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash


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
