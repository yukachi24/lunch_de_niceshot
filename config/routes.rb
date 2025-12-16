Rails.application.routes.draw do
  devise_for :users

  # ログイン後のTOP
  authenticated :user do
    root "homes#top", as: :authenticated_root
  end

  # 未ログイン時のTOP（Deviseを直接呼ばない）
  unauthenticated do
    root "homes#top"
  end

  resources :rounds
  resources :lunches, only: [:new, :create]
end
