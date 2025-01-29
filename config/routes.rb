Rails.application.routes.draw do
  root 'sheets#index'  # Make this the landing page
  resources :sheets, only: [:index, :destroy]
  get 'records/index'
  get 'imports/new'
  get 'imports/create'
  # devise_for :users, path: '', path_names: {
  #   sign_in: 'login',
  #   sign_out: 'logout',
  # },
  # controllers: {
  #   sessions: 'users/sessions',
  # }  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :imports, only: [:new, :create]
  resources :records, only: [:index]
  # Defines the root path route ("/")
  # root "posts#index"
  # scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
  #   resources :flight_tickets
  #   resources :rooming_lists
  #   resources :users
  #   resources :events
  #   resources :event_users
  #   resources :attachments
  # end
end
