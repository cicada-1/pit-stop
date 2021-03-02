Rails.application.routes.draw do
  get 'reviews/update'
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'pages#home'

  resources :rooms do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
    resources :room_socials, only: [:create]
  end

  resources :bands, only: [:show, :new, :edit, :create, :update, :destroy] do
    resources :reviews, only: [:update, :create]
    resources :gigs, only: [:update, :create]
    resources :band_socials, only: [:create]
    # resources :band_members
  end

    resources :bookings, only: [:destroy]
    resources :reviews, only: [:destroy]
    resources :gigs, only: [:destroy]
    resources :band_socials, only: [:destroy]
    resources :room_socials, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
