Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :appartments do
    resources :bookings, only: [:create, :destroy]
  end

  resources :bookings, only: [:index]

  get 'user_appartments', to: 'appartments#user_appartments'
end
