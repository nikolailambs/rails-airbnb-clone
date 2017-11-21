Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :bookings, except: [:new] do
    resources :reviews, only: [:create]
    resources :messages, only: [:create]
  end

  resources :offices do
    resources :bookings, only: [:create]
  end

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
