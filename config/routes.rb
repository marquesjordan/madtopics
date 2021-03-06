Rails.application.routes.draw do

  get 'topics/index'

  get 'topics/new'

  get 'topics/edit'

  get 'user_answers/index'
  
  post 'user_answers/create'

  get 'user_answers/new' => 'user_answers#new', as: :user_answers

  get 'user_answers/destroy'

  get 'user_answers/answer_ids'

  post 'user_answers/' => 'user_answers#create'

  get 'sessions/create'

  get 'sessions/new'

  get 'sessions/destroy'

  resources :users, except: [:destroy]
  resource :sessions, only: [:create, :new, :destroy]

  root 'pages#home'

  get 'questions/' => 'questions#index', as: :questions
  get 'questions/new' => 'questions#new', as: :new_question
  get 'questions/:id' => 'questions#show', as: :question
  post 'questions/' => 'questions#create'
  get 'questions/:id/edit' => 'questions#edit', as: :edit_question
  patch 'questions/:id' => 'questions#update', as: :update_question
  delete 'questions/:id' => 'questions#destroy', as: :delete_question

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
