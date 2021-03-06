SistemaDeMoteis::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => 'moteis#index'

  post 'login' => 'sessions#login', :as => 'login'
  get 'logout' => 'sessions#logout', :as => 'logout'


  match 'pagina_login' => 'application#pagina_login'
  match 'ativar/:id' => 'moteis#ativar', :as => 'ativar'
  match 'desativar/:id' => 'moteis#desativar', :as => 'desativar'
  match 'alterar_senha' => 'administradores#alterar_senha'
  post 'cadastrar_suite' => 'suites#cadastrar_suite'


  resources :sugestoes
  resources :moteis
  resources :suites
  resources :administradores, :only => :update
  
  ############### WEB SERVICES #################
  namespace :ws do
    get 'listagem_moteis_proximos' => 'ws#listagem_moteis_proximos'
    post 'criar_sugestao' => 'ws#criar_sugestao'
    get 'listagem_moteis_regiao' => 'ws#listagem_moteis_regiao'
    get 'listagem_moteis' => 'ws#listagem_moteis'
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
