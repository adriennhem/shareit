Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  root 'pages#home'

  get '/company' => 'pages#home_company'
  
  get '/about' => 'pages#about'

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]


  get '/complete/:id', to: 'projects#complete', as: 'complete'

  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
  

  resources :profiles

get '/user_projects' => 'profiles#user_projects', as: :user_projects


  resources :projects do
   resources :offers, only: [:create, :destroy]
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {registrations: 'registrations', sessions: 'sessions', invitations: 'users/invitations'}

  resources :enrollments

  resources :attachments

  resources :subscribers


  get 'courses', to: 'lectures#index', as: :courses
  get 'courses/:id', to: 'lectures#lecture_description', as: :lecture_description
  resources :lectures, only: [:show] do 
    resources :lessons, only: [:show]
  end

  resources :certificates 
  
  resources :user_lessons

  # Blog
  get '/blog' => 'posts#index'
  get 'blog/:id', to: 'posts#show', as: :post


  get 'feed' => 'posts#feed', format: 'rss'

  get 'tags/:tag', to: 'posts#index', as: :tag
  get 'blog_category/:blog_category', to: 'posts#index', as: :blog_category

  get '/landings/:id', to: 'landing_pages#show', as: :landing_page



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
