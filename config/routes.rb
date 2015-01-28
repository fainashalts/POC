Rails.application.routes.draw do
  devise_for :users
   root to: "topics#index"

  #sessions routes
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'

  #users routes
  get 'users/' => 'users#index'

  # This is commented out because we're now using devise for the signup page
  # get '/signup' => 'users#new', as: :new_user
  
  get 'users/:id' => 'users#show', as: :user

  post 'users/' => 'users#create'

  get 'users/:id/edit' => 'users#edit', as: :edit_user
  
  patch 'users/:id' => 'users#update', as: :update_user

  delete 'users/:id' => 'users#destroy'

  # This allows us to use devise for our routes
  
  devise_scope :user do
    get "signin", to: "devise/sessions#new"
    get "signup", to: "devise/registrations#new"
  end

  #topics routes
  get 'topics/' => 'topics#index'
  
  get 'topics/new' => 'topics#new', as: :new_topic
  
  get 'topics/:id' => 'topics#show', as: :topic
  
  post 'topics/' => 'topics#create'
  
  get 'topics/:id/edit' => 'topics#edit', as: :edit_topic
  
  patch 'topics/:id' => 'topics#update'

  delete 'topics/:id' => 'topics#destroy'

  #subtopics routes

  get 'subtopics/:id' => 'subtopics#show', as: :subtopic

  #links routes

  resources :links do
    member do 
      put "like", to: "links#upvote"
    end
    resources :comments
  end

  

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
