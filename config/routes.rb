Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :bookings, except: [:new] do
    resources :reviews, only: [:create]
  end

  resources :messages, only: [:index, :new, :create, :show, :destroy]

  resources :offices do
    resources :bookings, only: [:create]
  end

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
