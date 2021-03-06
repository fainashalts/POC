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

  # get 'users/:id/links/:id' => 'links#new', as: :user_links

  # post 'users/:id/links/:id' => 'links#new'

  # This allows us to use devise for our routes
  
  devise_scope :user do
    get "signin", to: "devise/sessions#new"
    get "signup", to: "devise/registrations#new"
  end


  resources :topics do
    resources :subtopics
  end

  get "/subtopics/:id" => 'subtopics#show', as: :subtopic
  get "/subtopics/new" => "subtopics#new", as: :subtopics
  post "/subtopics/new" => "subtopics#create"

  # we aren't nesting links/comments inside of topics/subtopics so that we can can access links without having to go through topics and subtopics
    resources :links do
      member do 
        put "like", to: "links#upvote"
      end 
      resources :comments, except: :index
    end  

    namespace :api do
        resources :links, only: [:index, :create, :show], defaults: {format: "json"}
        resources :topics, only: [:index, :create, :show], defaults: {format: "json"}
        resources :subtopics, except: [:topic_id], defaults: {format: "json"}
    end


    
  # end

  
  # We're creating these custom routes so that all links can be displayed and new links can be created without needing the topic & subtopic ID that the nested routes require
  # get 'links' => 'links#index'
  # get 'links/new' => 'links#new', as: :new_link

  # get '/comments' => 'comments#index'
  # post 'comments/' => 'comments#create'
  # get 'topics/' => 'topics#index'
  
  # get 'topics/new' => 'topics#new', as: :new_topic
  
  # get 'topics/:id' => 'topics#show', as: :topic
  
  # post 'topics/' => 'topics#create'
  
  # get 'topics/:id/edit' => 'topics#edit', as: :edit_topic
  
  # patch 'topics/:id' => 'topics#update'

  # delete 'topics/:id' => 'topics#destroy'

  # #subtopics routes

  # get 'subtopics/:id' => 'subtopics#show', as: :subtopic

  # #links routes




  

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
