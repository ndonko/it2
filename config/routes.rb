It2Solution::Application.routes.draw do
  get "projects/new"

  #devise_for :users

 # get "password_resets/new"
  
  #get "sessions/new"
  resources :clients
  resources :messages
  resources :sessions, :only => [:new, :create, :destroy]
  resources :password_resets
  resources :projects
  #------------------device route--------------------------
  # match '/registration',           :to =>'devise/registrations#new'
  
  
  
  #------------------------device routes----------------
  match "/passwordReset",              :to =>'password_resets#new'
  
   match '/signin',                    :to => 'sessions#new'
   
   match '/signout',                   :to => 'sessions#destroy'          
   
   match '/signup',                    :to => 'clients#new'  
               
   match '/site',                       :to => 'pages#site'
 
   match '/responsive',                 :to => 'pages#responsive'

   match '/ecommerce',                  :to => 'pages#ecommerce'
 
   match '/aide',                       :to => 'pages#aide'

   match '/contact',                    :to => 'messages#formulaire_message'
 
   match '/carriere',                   :to => 'pages#carriere'

   match '/messages/show',              :to => 'messages#show'  
   
   match 'messages/formulaire_message', :to => 'pages#contact'
   
  match '/offre_500',                    :to => 'pages#offre_500'
  
  match '/offre_1g',                    :to => 'pages#offre_1g'
   
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
