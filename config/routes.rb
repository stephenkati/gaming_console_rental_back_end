Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :consoles, only: [:index, :create, :destroy, :show]
      resources :reservations, only: [:create, :index, :destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    devise_for :users, controllers: {
      registrations: 'api/users/registrations',
      sessions: 'api/users/sessions'
    }
  end
end
