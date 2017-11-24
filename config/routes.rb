Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :messages, only: [:index, :new, :create, :show, :destroy]

  resources :bookings, only: [:index]

  resources :offices do
    resources :bookings, only: [:create]
    resources :messages, only: [:create]
    resources :reviews, only: :create
  end

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
