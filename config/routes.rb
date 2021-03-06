WineAppdb::Application.routes.draw do
  get "static/index"
  get "static/about"
  resources :screenshots

  get "user/prefs"
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # alias the wine_apps controller
  resources :apps, controller: :wine_apps, as: :wine_apps do

  # resources :wine_apps do
    resource :developer
    resources :screenshots
    post "vote", to: "votes#create", as: :create_vote
    patch "vote",  to: "votes#create", as: :update_vote
    get "votes", to: "votes#index"
    # get "vote", to: "votes#index", as: :vote_index
    
    # resources :install_instructions, controller: :wiki_entries, as: :wiki_entries
    # resources :wine_instructions, controller: :wiki_entries, as: :wiki_entries
    post "wiki/:wiki_type", to: "wiki_entries#create"
    resources :descriptions, controller: :wiki_entries, as: :wiki_entries
    resources :problems, controller: :wine_app_problems, as: :wine_app_problems
  end
  resources :problems, controller: :wine_app_problems, as: :wine_app_problems
  resources :developers

  # set the root to the landing page
  root 'static#index'
  
  get "prefs", to: "user#show"

  get 'profile', to: 'user#show'
  # get "app", to: "wine_apps#show"
  # post 'app', to: 'wine_apps#create'

  # resources :apps, controller: :wine_apps

  
  # get ':controller/:action/:id'

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
