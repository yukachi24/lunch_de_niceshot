Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "homes#top", as: :authenticated_root
  end

  unauthenticated do
    root "devise/sessions#new"
  end

  resources :rounds
  resources :lunches, only: [:new, :create]
end
