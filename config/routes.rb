Rails.application.routes.draw do
  resources :megusta
  resources :respuesta
  resources :comentarios
  resources :fotos
  resources :unirs
  get 'choise/index'

  resources :grupos
  get 'controlador/index'

  resources :cps
  resources :perfils
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  get 'home/index'

  resources :registros
  get 'join' => 'registros#join', as: :join
  get 'privado' => 'registros#private', as: :private
  get 'comenzar' => 'registros#comenzar', as: :comenzar
  get 'home' => 'home#index', as: :home
  get 'perfil' => 'perfils#new', as: :profile
  get 'webhook' => 'bot#webhook', as: :webhook
  get 'bot/webhook' => 'bot#webhook'
  post 'bot/webhook' => 'bot#receive_message'
  #delete 'unjoin/:grupo_id' => 'registros#eliminar', :via => :delete
  get 'unjoin' => 'registros#eliminar' , as: :unjoin
  get 'delete_images' => 'registros#eliminar_imagenes' , as: :delete_images
  delete 'registros/:id/delete' => 'registros#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'perfils/:id/:nombre' => 'perfils#edit' , as: :editar_perfil
  get 'recomienda' => 'registros#recomienda' , as: :recomienda

  get 'registros/:id/:titulo' => 'registros#show' , as: :show
  
   get 'grupos' => 'grupos#index', as: :group
   post "/grupos/:id" => "grupos#show"

  # You can have the root of your site routed with "root"
   root 'controlador#index'

    namespace :api do
    namespace :v1 do

      resources :directorios, path: "directorios"
      resources :get_direct, path: "get_direct"
      resources :get_imagen, path: "get_imagen"
      resources :get_comentarios, path: "get_comentarios"
      resources :get_respuestas, path: "get_respuestas"
      resources :get_megusta, path: "get_megusta"
      resources :servicios, path: "servicios"
      resources :servicio_all, path: "servicio_all"
      resources :directorios_random, path: "directorios_random"
      resources :bot_servicios, path: "bot_servicios"
    end
  end
   #get 'perfils/:id' => 'perfils#edit', :as => :editar_perfil

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
