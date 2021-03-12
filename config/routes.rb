Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :rooms do
    resources :bookings, only: [:create]
    resources :room_reviews, only: [:create]
    resources :room_socials, only: [:create]
  end

  resources :bands, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    resources :band_reviews, only: [:update, :create]
    resources :gigs, only: [:update, :create]
    resources :band_socials, only: [:create]
    resources :band_members, only: [:create]
  end

  resources :bookings, only: [:index] do
    member do
      patch :confirm
      patch :reject
    end
  end

  get '/bookings/requests', to: 'bookings#requests' do
    member do
      patch :confirm
      patch :reject
    end
  end

  resources :chatrooms, only: [:index, :show, :create] do
    resources :messages, only: :create
  end

  resources :band_members, only: [:destroy]
  resources :bookings, only: [:destroy]
  resources :room_reviews, only: [:destroy]
  resources :band_reviews, only: [:destroy]
  resources :gigs, only: [:destroy]
  resources :band_socials, only: [:destroy]
  resources :room_socials, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
